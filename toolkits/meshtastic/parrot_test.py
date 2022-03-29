import time

from datetime import datetime
from pubsub import pub

import meshtastic
import meshtastic.serial_interface


def onReceive(packet, interface):
	print(f"Received: {packet}")
	interface.sendText("autoreply: success!"+ datetime.now().strftime("%H:%M:%S"))
	#interface.sendText("pong (" + packet.decoded.payload + ") " + datetime.now().strftime("%H:%M:%S"))

def onConnection(interface, topic=pub.AUTO_TOPIC): 
	print("connected")
	interface.sendText("connected");

	
interface = meshtastic.serial_interface.SerialInterface("/dev/ttyACM0")
#interface.localNode.setOwner("test", "test")

pub.subscribe(onReceive, "meshtastic.receive.text")
pub.subscribe(onConnection, "meshtastic.connection.established")


while True:
	time.sleep(1000)
