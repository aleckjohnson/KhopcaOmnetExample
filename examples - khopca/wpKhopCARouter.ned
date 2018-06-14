//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
//

import inet.node.inet.WirelessHost;
import inet.routing.khopca.KHOPCARouting;

module wpKhopCARouter extends WirelessHost
{
    
    parameters:
        @node;
    	@display("t=Weight: unavailable");
        forwarding = true;
        wlan[*].mgmtType = default("Ieee80211MgmtAdhoc");
        // WPTracker
        @class(WaypointTrackerNode);
        double speed @unit("mps") = default(10mps);  // the speed of the mobile nodes
        double waypointProximity @unit("m") = default(5m);      // switch to the next waypoint if the current waypoint target is closer than this
        string trackFile;                            // a file with longitude latitude pairs
		// Mobile Node
		string modelURL;                             // the URL/filename of the 3D model to be used for the node
                                                     // (you can use osg pseudo filters like: modelname.osgb.3.scale.0,0,45.rot scaleX3, rotate 45 deg around Z)
        string modelColor = default("");             // colorizes the 3D model used for the node
        // decorations and annotations
        string labelColor = default("#000000ff");    // the color of the model label in hex RRGGBBAA format or "" to turn off labels
        bool showTxRange = default(true);            // whether to show the transmission range around the nodes
        string rangeColor = default("#ff000040");    // the color of the range indicator in hex RRGGBBAA format
        string trailColor = default("#000000ff");    // the color of the trail indicator in hex RRGGBBAA format
        int trailLength = default(0);	             // the length of the trail in time steps showing the past movement of the node. 0 disables the trail
        double txRange @unit("m") = default(200m);   // the transmission range of the mobile node's radio
        double timeStep @unit("s") = default(33ms);  // the time granularity of movement calculation (for 30fps)
        double startTime @unit("s") = default(0s);   // time when the movement starts
		
    submodules:
        
        khopca: KHOPCARouting {
            @display("p=558,307");
        }
        
    connections allowunconnected:
        
        khopca.ipOut --> networkLayer.transportIn++;
        khopca.ipIn <-- networkLayer.transportOut++;
        
}