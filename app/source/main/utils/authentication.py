from requests.auth import HTTPBasicAuth

def get_http_basic_authentication(username: str, password: str)->str:
    basic_auth = HTTPBasicAuth(username, password)
    print(type(basic_auth))
    print(dir(basic_auth))
    return basic_auth
