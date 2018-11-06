from datetime import datetime
from uuid import uuid4
from collections import deque


class Consumer:

    def __init__(self):
        self.id = uuid4()
        self.queue = deque()

    def enqueue(self, message):
        self.queue.append(message)
        message.enqueued()

    def pop(self):
        if len(self.queue) > 0:
            message = self.queue.popleft()
            message.dequeued()
            return message
        else:
            return None

    def clear_queue(self):
        while len(self.queue) > 0:
            message = self.queue.popleft()
            message.dequeued()


class Channel:

    def __init__(self, channel_id):
        self.id = channel_id
        self.consumers = {}
        self.message_dict = {}

    def create_message(self, payload):
        return Message(payload, self.remove_message)

    def subscribe(self, consumer):
        self.consumers[str(consumer.id)] = consumer

    def unsubscribe(self, consumer_id):
        if consumer_id in self.consumers:
            consumer = self.consumers[consumer_id]
            consumer.clear_queue()
            del self.consumers[consumer_id]

    def push(self, message):
        self.message_dict[str(message.id)] = message
        for consumer_id in self.consumers:
            self.consumers[consumer_id].enqueue(message)

    def pop(self, consumer_id):
        if consumer_id in self.consumers:
            consumer = self.consumers[consumer_id]
            return consumer.pop()
        else:
            raise ValueError("No consumer of id# {0}".format(consumer_id))

    def remove_message(self, message_id):
        del self.message_dict[message_id]


class Message:

    def __init__(self, payload, callback):
        self.id = uuid4()
        self.timestamp = datetime.utcnow()
        self.payload = payload
        self.__queue_count = 0
        self.__on_queue_cleared = callback

    def enqueued(self):
        self.__queue_count += 1

    def dequeued(self):
        self.__queue_count -= 1
        if self.__queue_count == 0:
            self.__on_queue_cleared(str(self.id))
            self.__on_queue_cleared = None

    def as_dict(self):
        return {'id': self.id, 'timestamp': self.timestamp, 'payload': self.payload}


