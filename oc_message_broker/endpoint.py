import json
from oc_message_broker.message import Channel
from oc_message_broker.message import Consumer
from oc_message_broker.utils import json_resp

channels = {}


def handle_request(request):
    req_dict = json.loads(request)
    action = req_dict['action']
    channel_dict = req_dict['channel']
    # any action can create channel
    channel_id = channel_dict['id']
    if channel_id not in channels:
        channels[channel_id] = Channel(channel_id)

    channel = channels[channel_id]

    if action == 'broadcast':
        message_payload = req_dict['message']
        channel.push(channel.create_message(message_payload))
        return json_resp({'message': 'ok', 'status': 0})
    elif action == 'subscribe':
        consumer = Consumer()
        channel.subscribe(consumer)
        return json_resp({'message': 'ok', 'status': 0, 'data': str(consumer.id)})
    elif action == 'poll':
        consumer_id = req_dict['consumer_id']
        try:
            message = channel.pop(consumer_id)
            if message:
                return json_resp({'message': 'ok', 'status': 0, 'data': message.as_dict()})
            else:
                return json_resp({'message': 'ok', 'status': 0, 'data': None})
        except ValueError:
            return json_resp({'message': 'consumer not exist', 'status': 1, 'data': None})
    elif action == 'unsubscribe':
        consumer_id = req_dict['consumer_id']
        channel.unsubscribe(consumer_id)
        return json_resp({'message': 'ok', 'status': 0})
