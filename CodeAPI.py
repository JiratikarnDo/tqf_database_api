from flask import Flask, jsonify, request
import mysql.connector
from datetime import datetime
import pytz
from flask import request
from mysql.connector import Error



app = Flask(__name__)

# ฟังก์ชันสร้าง Connection ไปยัง MySQL
def create_db_connection():
    try:
        return mysql.connector.connect(
            host="localhost",
            user="root",
            password="1234",
            database="tqf_database"
        )
    except mysql.connector.Error as err:
        print(f"Database connection error: {err}")
        return None

# ฟังก์ชันแปลง `last_updated` เป็นภาษาไทย
def convert_datetime_to_thai(datetime_obj):
    months_thai = [
        "มกราคม", "กุมภาพันธ์", "มีนาคม", "เมษายน", "พฤษภาคม", "มิถุนายน",
        "กรกฎาคม", "สิงหาคม", "กันยายน", "ตุลาคม", "พฤศจิกายน", "ธันวาคม"
    ]
    days_thai = ["จันทร์", "อังคาร", "พุธ", "พฤหัสบดี", "ศุกร์", "เสาร์", "อาทิตย์"]

    bangkok_tz = pytz.timezone("Asia/Bangkok")
    datetime_obj = datetime_obj.astimezone(bangkok_tz)

    day_name = days_thai[datetime_obj.weekday()]
    day = datetime_obj.day
    month = months_thai[datetime_obj.month - 1]
    year = datetime_obj.year + 543  # แปลง ค.ศ. เป็น พ.ศ.
    time_str = datetime_obj.strftime("%H:%M:%S")

    return f"{day_name}, {day} {month} {year} {time_str}"

#API ดึงข้อมูลรายวิชา section 1
@app.route('/course/<string:course_code>', methods=['GET'])
def get_course_details(course_code):
    conn = create_db_connection()
    if conn is None:
        return jsonify({"error": "Database connection failed"}), 500

    try:
        cursor = conn.cursor(dictionary=True)
        query = """
            SELECT 
                c.course_code, c.course_name, c.credit_details,
                cur.curriculum_detail, cat.category_type,
                CONCAT(u.firstname, ' ', u.surname) AS teacher_name,
                c.semester, c.pre_requisites, c.co_requisites,
                c.location, c.last_updated
            FROM course c
            JOIN curriculum cur ON c.curriculum_id = cur.curriculum_id
            JOIN coursecategory cat ON c.branch_id = cat.course_category_id
            JOIN users u ON c.teacher_id = u.teacher_id
            WHERE c.course_code = %s
        """
        cursor.execute(query, (course_code,))
        course = cursor.fetchone()
    finally:
        cursor.close()
        conn.close()

    if course:
        if course["last_updated"]:
            course["last_updated"] = convert_datetime_to_thai(course["last_updated"])
        return jsonify(course)
    else:
        return jsonify({"error": "Course not found"}), 404
    
#อัพเดทข้อมูล section 1 
@app.route('/course/<string:course_code>', methods=['PUT'])
def update_course_details(course_code):
    conn = create_db_connection()
    if conn is None:
        return jsonify({"error": "Database connection failed"}), 500

    data = request.get_json()  # รับ JSON ที่ส่งมาใน Body
    if not data:
        return jsonify({"error": "Missing request body"}), 400

    try:
        cursor = conn.cursor(dictionary=True)

        # ✅ ตรวจสอบก่อนว่ามีวิชานี้จริงหรือไม่
        cursor.execute("SELECT course_id FROM course WHERE course_code = %s", (course_code,))
        course = cursor.fetchone()
        if not course:
            return jsonify({"error": "Course not found"}), 404

        # ✅ คำสั่ง SQL สำหรับอัปเดต
        query = """
            UPDATE course 
            SET course_name = %s, credit_details = %s, curriculum_id = %s, branch_id = %s, 
                teacher_id = %s, semester = %s, pre_requisites = %s, co_requisites = %s, 
                location = %s, last_updated = NOW()
            WHERE course_code = %s
        """

        values = (
            data.get("course_name"),
            data.get("credit_details"),
            data.get("curriculum_id"),
            data.get("branch_id"),
            data.get("teacher_id"),
            data.get("semester"),
            data.get("pre_requisites"),
            data.get("co_requisites"),
            data.get("location"),
            course_code
        )

        cursor.execute(query, values)
        conn.commit()

    finally:
        cursor.close()
        conn.close()

    return jsonify({"message": "Course updated successfully"})

#API ดึงข้อมูลในหมวดที่ 2
@app.route('/course/section2', methods=['GET'])
def get_course_section2():
    course_code = request.args.get('course_code')
    if not course_code:
        return jsonify({"error": "Missing course_code"}), 400

    conn = create_db_connection()
    if conn is None:
        return jsonify({"error": "Database connection failed"}), 500

    try:
        cursor = conn.cursor(dictionary=True)
        query = """
        SELECT s.course_objectives, s.course_development_objectives
        FROM section2 s
        JOIN course c ON s.section2_id = c.course_id
        WHERE c.course_code = %s;
        """
        cursor.execute(query, (course_code,))
        result = cursor.fetchone()
    finally:
        cursor.close()
        conn.close()

    return jsonify(result) if result else jsonify({"message": "No data found"}), 404

# API ดึงข้อมูล section3
@app.route('/course/section3', methods=['GET'])
def get_course_section3():
    course_code = request.args.get('course_code')
    if not course_code:
        return jsonify({"error": "Missing course_code"}), 400

    conn = create_db_connection()
    if conn is None:
        return jsonify({"error": "Database connection failed"}), 500

    try:
        cursor = conn.cursor(dictionary=True)
        query = """
        SELECT s.course_descriptions, s.consultation_Hours
        FROM section3 s
        JOIN course c ON s.course_id = c.course_id
        WHERE c.course_code = %s;
        """
        cursor.execute(query, (course_code,))
        result = cursor.fetchone()
    finally:
        cursor.close()
        conn.close()

    return jsonify(result) if result else jsonify({"message": "No data found"}), 404


#section 5 
@app.route("/course-plan", methods=["GET"])
def get_course_plan():
    course_code = request.args.get("course_code")  # รับค่ารหัสวิชา
    
    if not course_code:
        return jsonify({"error": "Missing course_code"}), 400
    
    conn = create_db_connection()
    if conn is None:
        return jsonify({"error": "Database connection failed"}), 500

    try:
        cursor = conn.cursor(dictionary=True)

        # ดึงข้อมูลแผนการสอน
        query_teaching = """
            SELECT 
                tp.teaching_plan_id,
                tp.week_number,
                tp.descriptions AS teaching_plan_description,
                tp.total_hours,
                tp.activity_performed,
                c.course_code,
                c.course_name,
                u.firstname AS teacher_firstname,
                u.surname AS teacher_surname
            FROM teachingplan tp
            JOIN course c ON tp.teacher_id = c.teacher_id
            JOIN users u ON c.teacher_id = u.teacher_id
            WHERE c.course_code = %s
        """
        cursor.execute(query_teaching, (course_code,))
        teaching_plan = cursor.fetchall()

        # ดึงข้อมูลแผนการประเมิน
        query_assessment = """
            SELECT 
                ap.assessment_plan_id,
                ap.activity_order,
                ap.learning_outcome,
                ap.evaluation_method,
                ap.assessment_week,
                ap.assessment_weight
            FROM assessment_plan ap
            JOIN section5 s5 ON ap.assessment_plan_id = s5.assessment_plan_id
            JOIN teachingplan tp ON s5.teachingplan_id = tp.teaching_plan_id
            JOIN course c ON tp.teacher_id = c.teacher_id
            WHERE c.course_code = %s
        """
        cursor.execute(query_assessment, (course_code,))
        assessment_plan = cursor.fetchall()

        return jsonify({
            "course_code": course_code,
            "teaching_plan": teaching_plan,
            "assessment_plan": assessment_plan
        })

    except Exception as e:
        return jsonify({"error": str(e)}), 500

    finally:
        cursor.close()
        conn.close()

#ดึงข้อมูลในหมวดที่ 6
@app.route("/course/section6", methods=["GET"])
def get_course_section6():
    course_code = request.args.get("course_code")  # รับค่ารหัสวิชา
    
    if not course_code:
        return jsonify({"error": "Missing course_code"}), 400

    conn = create_db_connection()
    if conn is None:
        return jsonify({"error": "Database connection failed"}), 500

    try:
        cursor = conn.cursor(dictionary=True)

        query = """
            SELECT 
                s6.primary_Textbook, 
                s6.important_Documents_Info
            FROM section6 s6
            JOIN course c ON s6.course_id = c.course_id
            WHERE c.course_code = %s
        """
        cursor.execute(query, (course_code,))
        result = cursor.fetchall()

        return jsonify(result)

    except Exception as e:
        return jsonify({"error": str(e)}), 500

    finally:
        cursor.close()
        conn.close()

#section7 ดึงข้อมูลในหมวดที่7
@app.route("/course/section7", methods=["GET"])
def get_course_section7():
    course_code = request.args.get("course_code")  # รับค่ารหัสวิชา
    
    if not course_code:
        return jsonify({"error": "Missing course_code"}), 400

    conn = create_db_connection()
    if conn is None:
        return jsonify({"error": "Database connection failed"}), 500

    try:
        cursor = conn.cursor(dictionary=True)

        query = """
            SELECT 
                s7.student_evaluation_strategy,
                s7.teaching_evaluation_strategy,
                s7.teaching_improvement,
                s7.student_achievement_review,
                s7.course_improvement_plan
            FROM section7 s7
            JOIN course c ON s7.course_id = c.course_id
            WHERE c.course_code = %s
        """
        cursor.execute(query, (course_code,))
        result = cursor.fetchall()

        return jsonify(result)

    except Exception as e:
        return jsonify({"error": str(e)}), 500

    finally:
        cursor.close()
        conn.close()





if __name__ == '__main__':
    app.run(debug=True)
