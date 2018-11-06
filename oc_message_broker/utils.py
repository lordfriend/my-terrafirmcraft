import json
from datetime import datetime, date
import uuid

epoch = datetime.utcfromtimestamp(0)


class DateTimeEncoder(json.JSONEncoder):
    def default(self, o):
        if isinstance(o, datetime):
            return int((o - epoch).total_seconds() * 1000)
        elif isinstance(o, date):
            return o.strftime('%Y-%m-%d')
        elif isinstance(o, uuid.UUID):
            return str(o)
        else:
            return json.JSONEncoder.default(self, o)


def json_resp(dict_obj):
    return json.dumps(dict_obj, cls=DateTimeEncoder)
