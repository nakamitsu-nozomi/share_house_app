Geocoder.configure(

    # street address geocoding service (default :nominatim)
    lookup: :google,

    # to use an API key:
    api_key: "AIzaSyCviXl7JqAtAgCmgeMfZYKb0FZYqaONLwc",

    # geocoding service request timeout, in seconds (default 3):
    timeout: 5,

    # set default units to kilometers:
    units: :km,

    use_https: true

)
