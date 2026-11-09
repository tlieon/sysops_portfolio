import socket

def dns_resolver(target):
    try:
        return socket.gethostbyname(target)
        
    except socket.gaierror:
        print("SON, we could not resolve this gng!")
        return
    except Exception as e:
        print("We lowkenuinely don't know where it went wrong...")
        return
    finally:
        print("DNS resolving phase is now finished. Moving on...")


