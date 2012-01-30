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

package ddos.simulations;

import inet.nodes.ipv6.Router6;
import inet.nodes.ipv6.StandardHost6;
import ned.DatarateChannel;
import inet.networklayer.autorouting.FlatNetworkConfigurator6;

//
// TODO auto-generated type
//
network Ddos
{
    parameters:
        int numClients;
        
    types:
       	channel ethernetline extends DatarateChannel
        {
            delay = 0.1us;
        }
        
    submodules:
        configurator: FlatNetworkConfigurator6;
        r1: Router6;
        r2: Router6;
        server: StandardHost6;
        clients[numClients]: StandardHost6;
        
    connections:
        for i=0..numClients-1 {
            clients[i].ethg++ <--> ethernetline <--> r1.ethg++;
        }
        r1.ethg++ <--> ethernetline <--> r2.ethg++;
        r2.ethg++ <--> ethernetline <--> server.ethg++;
}
