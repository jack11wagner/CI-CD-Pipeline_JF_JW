from simple_app import app


# def test_BTC_Currency():
#     app.config['TESTING'] = True
#     client = app.test_client()

#     result = client.get('/')

#     assert 'Currency :' in str(result.data)


# def test_last_price():
#     app.config['TESTING'] = True
#     client = app.test_client()

#     result = client.get('/')

#     assert 'Last Price :' in str(result.data)


# def test_1D_price_change():
#     app.config['TESTING'] = True
#     client = app.test_client()

#     result = client.get('/')

#     assert '1D Price Change :' in str(result.data)


# def test_BTC_logo_present():
#     app.config['TESTING'] = True
#     client = app.test_client()

#     logo_url = "https://s3.us-east-2.amazonaws.com/nomics-api/static/images/currencies/btc.svg"
#     result = client.get('/')

#     assert logo_url in str(result.data)
