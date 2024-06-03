import requests
import json

import requests.auth
from requests.auth import HTTPBasicAuth, HTTPDigestAuth


def send_request_with_basic_authen(method:    str,
                                    base_url:  str,
                                    uri:       str,
                                    headers:   dict,
                                    username:  str,
                                    password:  str):
    headers = headers if headers else {}
    headers = str(headers)
    headers = headers.replace("\'", "\"")
    headers = json.loads(headers)
    res = requests.request(method=method,
                               url=base_url + uri,
                               headers=headers,
                               auth=(username, password))
    print(f'url request: {res.url}')
    print(f'response content: {res.text}')
    return res

def send_request_with_degist_authen(method:    str,
                                    base_url:  str,
                                    uri:       str,
                                    headers:   dict,
                                    username:  str,
                                    password:  str):
    headers = headers if headers else {}
    headers = str(headers)
    headers = headers.replace("\'", "\"")
    headers = json.loads(headers)
    res = requests.request(method=method,
                               url=base_url + uri,
                               headers=headers,
                               auth=HTTPDigestAuth(username, password))
    print(f'url request: {res.url}')
    print(f'response content: {res.text}')
    return res


def send_request(method:    str,
                 base_url:  str,
                 uri:       str,
                 headers:   dict=None,
                 payload:   dict=None):
    """
    Send api request to server
    :param method: put, get, delete, post
    :type method: str
    :param base_url: domain of server
    :type base_url: str
    :param uri: uri of api
    :type uri: str
    :param headers: headers of request
    :type headers: dict
    :param payload: body payload of request
    :type payload: dict
    :return: response dictionary
    :return: dict
    """
    headers = headers if headers else {}
    payload = payload if payload else {}
    payload = json.dumps(payload)
    headers = str(headers)
    headers = headers.replace("\'", "\"")
    headers = json.loads(headers)
    res = requests.request(method=method,
                               url=base_url + uri,
                               headers=headers,
                               data=payload)
    print(f'url request: {res.url}')
    print(f'response content: {res.text}')
    return res
