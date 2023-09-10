import boto3
import uuid
from flask import Flask, render_template, request, redirect, url_for

app = Flask(__name__)

S3_BUCKET_NAME = 'cybertalents-flask-app'
S3_BUCKET_FOLDER = 'csv-files/'

s3 = boto3.client('s3')

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/submit', methods=['POST'])
def submit():
    data = request.form['data']

    # Create a CSV 
    csv_data = f"TIMESTAMP,APP SOURCE,MESSAGE PAYLOAD\n{data}"

    # Generate filename 
    filename = f"data_{uuid.uuid4()}.csv"

    # Upload the CSV data to S3
    s3.put_object(
        Bucket=S3_BUCKET_NAME,
        Key=f"{S3_BUCKET_FOLDER}{filename}",
        Body=csv_data,
        ContentType='text/csv'
    )

    return redirect(url_for('index'))

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000, debug=True, threaded=True)

