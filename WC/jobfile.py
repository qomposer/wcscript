# writing text to a .job file
TEST_TABLE = """
T1^
 OR,OB,OS,S1,S2,O%,OI
 Q1. Overall Liking
 Total ^TN^0
 T3B ^Q1_1(8-10)^
 T2B ^(9-10)^
 Like Extremely ^(10)^
 9- ^(9)^
 8- ^(8)^
 7- ^(7)^
 6- ^(6)^
 5- ^(5)^
 4- ^(4)^
 3- ^(3)^
 2- ^(2)^
 Dislike Extremely ^(1)^
"""
text_file_name = "sample_file_text.txt"
job_file_name = "sample_file_job.job"
test_files = [text_file_name, job_file_name]

try:
    for test_file in test_files:
        with open(f"./{test_file}", "w") as example_file:
            example_file.write(TEST_TABLE)
        print(f"Done writing text to {test_file}")
except Exception as e:
    print(e)