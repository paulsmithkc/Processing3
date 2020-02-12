import net.sourceforge.jpcap.capture.*;
import net.sourceforge.jpcap.net.*;
import net.sourceforge.jpcap.simulator.*;
import net.sourceforge.jpcap.util.*;
import org.rsg.carnivore.*;
import org.rsg.carnivore.cache.*;
import org.rsg.carnivore.net.*;

/**
 * 3: Carnivore Client
 *  
 * This example requires the Carnivore Library for Processing (http://r-s-g.org/carnivore)
 * On Windows, first install winpcap (http://winpcap.org)
 * On Mac OS X, first open a Terminal and execute this commmand: sudo chmod 777 /dev/bpf*
 * (This must be done each time you reboot your Mac)
 */

import java.util.Iterator;
import org.rsg.carnivore.*;
import org.rsg.carnivore.net.*;
import org.rsg.lib.Log;

HashMap nodes = new HashMap();
float startDiameter = 100.0;
float shrinkSpeed = 0.97;
CarnivoreP5 c;

void setup(){
  size(400, 400);
  ellipseMode(CENTER);

  Log.setDebug(true); // Uncomment this for verbose mode
  c = new CarnivoreP5(this);
  //c.setVolumeLimit(4);
}

void draw() {
  background(255);
  drawNodes();
}

// Iterate through each node
synchronized void drawNodes() {
  Iterator it = nodes.keySet().iterator();
  while (it.hasNext()){
    String ip = (String)it.next();
    float d = float(nodes.get(ip).toString());

    // Use last two IP address bytes for x/y coords

    String ip_as_array[] = split(ip, '.');
    int x = int(ip_as_array[2]) * width / 255; // Scale to applet size
    int y = int(ip_as_array[3]) * height / 255; // Scale to applet size
    
    // Draw the node
    stroke(0);
    fill(color(100, 200));  // Rim
    ellipse(x, y, d, d);    // Node circle
    noStroke();
    fill(color(100, 50));   // Halo
    ellipse(x, y, d + 20, d + 20);
    
    // Draw the text
    fill(0);
    text(ip, x, y);
    
    // Shrink the nodes a little
    if(d > 50) {
        nodes.put(ip, str(d * shrinkSpeed));
    }
  }  
}

// Called each time a new packet arrives
synchronized void packetEvent(CarnivorePacket packet){
  println("[PDE] packetEvent: " + packet);

  // Remember these nodes in our hash map
  nodes.put(packet.receiverAddress.toString(), str(startDiameter));
  nodes.put(packet.senderAddress.toString(), str(startDiameter));
}
