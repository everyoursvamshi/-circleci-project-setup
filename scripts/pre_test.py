import json

def validateJSON(jsonData):
    try:
        json.loads(jsonData)
    except ValueError as err:
        return False
    return True



validJsonData = """{"name": "jane doe", "salary": 9000, "email": "jane.doe@pynative.com", "test": }"""
isValid = validateJSON(validJsonData)

print("Given JSON string is Valid", isValid)
