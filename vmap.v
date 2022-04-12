import os
import net

fn logo() {
println("██╗   ██╗███╗   ███╗ █████╗ ██████╗ ")
println("██║   ██║████╗ ████║██╔══██╗██╔══██╗")
println("██║   ██║██╔████╔██║███████║██████╔╝")
println("╚██╗ ██╔╝██║╚██╔╝██║██╔══██║██╔═══╝ ")
println(" ╚████╔╝ ██║ ╚═╝ ██║██║  ██║██║     ")
println("  ╚═══╝  ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     ")
}

fn code(){
    mut remote_ip := " "
    if os.args.len < 2 {
        remote_ip = '127.0.0.1'
    } else {
        remote_ip = os.args[1]
    }

    ports := {'git' : 9418, 'mysterium' : 4449, 'openvpn tcp' : 443, 'openvpn udp' : 1194, 'wireguard' : 51820, 'http' : 80, 'https' : 443, 'ftp' : 21, 'ssh' : 22,'telnet' : 23, 'dns' : 53, 'smtp' : 25 , 'ipp' : 631, 'dhcp1' : 67, 'dhcp2' : 68, 'tftp' : 69, 'pop' : 110, 'ntp' : 123, 'imap' : 143, 'snmp1' : 161, 'snmp2' : 162, 'bgp' : 179, 'ldap' : 389, 'ldaps' : 636, 'ftps1' : 989, 'fpts2' : 990}
    for key, value in ports {

        mut conn := net.dial_tcp("$remote_ip:$value") or { continue }
        if ip := conn.peer_ip() {
            println("[+] Port $value for $key is open")
        } else {

        }

        conn.close() or {}
    }
}

fn main() {
    
    logo()
    code()

}
