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

import inet.common.figures.DelegateSignalConfigurator;
import inet.networklayer.configurator.ipv4.IPv4NetworkConfigurator;
import inet.node.inet.INetworkNode;
import inet.physicallayer.contract.packetlevel.IRadioMedium;
import inet.visualizer.integrated.IntegratedCanvasVisualizer;
import inet.environment.common.PhysicalEnvironment;
import inet.common.lifecycle.LifecycleController;


network HostToHost
{
    parameters:
        string hostType = default("WirelessHost");
        string mediumType = default("IdealRadioMedium");
        @display("bgb=1200,1000;bgg=100,1,grey95");
        @figure[title](type=label; pos=0,-1; anchor=sw; color=darkblue);
        @figure[rcvdPkText](type=indicatorText; pos=420,20; anchor=w; font=,20; textFormat="packets received: %g"; initialValue=0);
        @statistic[rcvdPk](source=hostB_rcvdPk; record=figure(count); targetFigure=rcvdPkText);
        @signal[hostB_rcvdPk];
        @delegatesignal[rcvdPk](source=hostB.udpApp[0].rcvdPk; target=hostB_rcvdPk);
        
    submodules:
        visualizer: IntegratedCanvasVisualizer {
            @display("p=580,125");
        }
        configurator: IPv4NetworkConfigurator {
            @display("p=580,200");
        }
        radioMedium: <mediumType> like IRadioMedium {
            @display("p=580,275");
        }
        figureHelper: DelegateSignalConfigurator {
            @display("p=580,350");
        }
        hostA: <hostType> like INetworkNode {
            @display("p=50,325");
        }
        hostB: <hostType> like INetworkNode {
            @display("p=450,325");
        }
}

network SeveralNodes extends HostToHost
{
    submodules:
        hostR1: <hostType> like INetworkNode {
            @display("p=250,300");
        }
        hostR2: <hostType> like INetworkNode {
            @display("p=150,450");
        }
        hostR3: <hostType> like INetworkNode {
            @display("p=350,450");
        }
}

network PhysicalObstacle extends SeveralNodes
{
    submodules:
        physicalEnvironment: PhysicalEnvironment {
            @display("p=580,425");
        }
}

network SeveralMoreNodes extends PhysicalObstacle
{
    submodules:
        hostR4: <hostType> like INetworkNode {
            @display("p=120,300");
        }
        hostR5: <hostType> like INetworkNode {
            @display("p=150,230");
        }
        hostR6: <hostType> like INetworkNode {
            @display("p=100,100");
        }
}

network PhysicalObstacle2
{
    submodules:
        physicalEnvironment: PhysicalEnvironment {
            @display("p=580,425");
        }
}

network VariableNodesNetwork extends PhysicalObstacle2 {
    
    parameters:
        	int numHosts;
            string hostType = default("WirelessHost");
            string mediumType = default("IdealRadioMedium");
            @display("bgb=1200,1000;bgg=100,1,grey95");
            @figure[title](type=label; pos=0,-1; anchor=sw; color=darkblue);
            @figure[rcvdPkText](type=indicatorText; pos=1000,20; anchor=w; font=,20; textFormat="packets received: %g"; initialValue=0);
            @statistic[rcvdPk](source=hostB_rcvdPk; record=figure(count); targetFigure=rcvdPkText);
            @signal[hostB_rcvdPk];
            @delegatesignal[rcvdPk](source=hostB.udpApp[0].rcvdPk; target=hostB_rcvdPk);

	submodules:
	    visualizer: IntegratedCanvasVisualizer {
            @display("p=1080,125");
        }
        configurator: IPv4NetworkConfigurator {
            @display("p=1080,200");
        }
        radioMedium: <mediumType> like IRadioMedium {
            @display("p=1080,275");
        }
        figureHelper: DelegateSignalConfigurator {
            @display("p=1080,350");
        }
        lifecycleController: LifecycleController {
            parameters:
                @display("p=1080,350");
        }
        hostA: <hostType> like INetworkNode {
            @display("p=50,325");
        }
        hostB: <hostType> like INetworkNode {
            @display("p=750,325");
        }
        hostR[numHosts]: <hostType> like INetworkNode {
            parameters:
                @display("p=500,500;r=,,#707070");
        }
}

network multipleNodesNetwork {
    
    parameters:
        	int numHosts;
            string hostType = default("WirelessHost");
            string mediumType = default("IdealRadioMedium");
            @display("bgb=1200,1000;bgg=100,1,grey95");
            @figure[title](type=label; pos=0,-1; anchor=sw; color=darkblue);
            @figure[rcvdPkText](type=indicatorText; pos=1000,20; anchor=w; font=,20; textFormat="packets received: %g"; initialValue=0);
            @statistic[rcvdPk](source=hostB_rcvdPk; record=figure(count); targetFigure=rcvdPkText);
            @signal[hostB_rcvdPk];
            @delegatesignal[rcvdPk](source=hostB.udpApp[0].rcvdPk; target=hostB_rcvdPk);

	submodules:
	    visualizer: IntegratedCanvasVisualizer {
            @display("p=1080,125");
        }
        configurator: IPv4NetworkConfigurator {
            @display("p=1080,200");
        }
        radioMedium: <mediumType> like IRadioMedium {
            @display("p=1080,275");
        }
        figureHelper: DelegateSignalConfigurator {
            @display("p=1080,350");
        }
        lifecycleController: LifecycleController {
            parameters:
                @display("p=1080,425");
        }
        hostA: <hostType> like INetworkNode {
            @display("p=50,325");
        }
        hostB: <hostType> like INetworkNode {
            @display("p=750,325");
        }
        hostR[numHosts]: <hostType> like INetworkNode {
            parameters:
                @display("p=500,500;r=,,#707070");
        }
        hostC: <hostType> like INetworkNode {
         	@display("p=500,400");   
        }
}
 //##### (marker for doxygen)