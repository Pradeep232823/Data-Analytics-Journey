import pandas as pd
from sqlalchemy import create_engine
from urllib.parse import quote_plus

# MySQL connection details
user = "root"
password = quote_plus("Prannu@143")   # IMPORTANT: URL-encoded
host = "localhost"
port = "3306"
database = "swiggy_db"

# Create engine
engine = create_engine(
    f"mysql+mysqlconnector://{user}:{password}@{host}:{port}/{database}"
)

# Test connection
engine.connect()
print("✅ MySQL connection successful!")

# Read Excel file (ALL sheets)
excel_file = (
    "C:/Users/ADMIN/Data-Analytics-Journey/"
    "06-projects/phase2-mini-project/data/"
    "swiggy_dataset_cleaned.xlsx"
)

all_sheets = pd.read_excel(excel_file, sheet_name=None)

# Load each sheet into MySQL
for sheet_name, df in all_sheets.items():
    df.to_sql(
        name=sheet_name.lower(),
        con=engine,
        if_exists="replace",   # change to 'append' if needed
        index=False
    )

print("✅ Excel successfully imported into MySQL!")