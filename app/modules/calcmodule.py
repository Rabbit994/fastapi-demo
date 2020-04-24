#Supports Calculations

def perform_operation(number1: int, number2: int, op:str) -> dict:
    """This adds/subtract/multiply/divide/exponetially based on input"""
    if op == "add":
        result = number1 + number2
        return {"result": int(result)}
    elif op == "subtract":
        result = number1 - number2
        return {"result": int(result)}
    elif op == "multiply":
        result = number1 * number2
        return {"result": int(result)}
    elif op == "divide":
        try:
            result = number1 / number2
            return {"result": int(result)}
        except ZeroDivisionError:
            return {"error": "Divide by zero"}
    elif op == "expo":
        result = number1 ** number2
        return {"result": int(result)}
    else:
        return {"error": "Unknown Operator"}