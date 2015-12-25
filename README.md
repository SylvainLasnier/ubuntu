Ubuntu 15.10 Docker image
=============================

Description
-----------

This is the Original Ubuntu 15.10 root docker images. It is small and basic.

It includes fresh installation of Ubuntu 15.10 distribution, english language, universe apt packages and some basic common packages: vim-tiny editor, bash-completion to save time, curl to use webservices and supervisor to run easily more process in Docker VM.  

So, this image respects pragmatic simple vision of Docker.  
If you are looking for a complete VM, just use LXC.  
**LXC** is an amazing product to get fast **full VM** where **Docker** is amazing to get only **one service by VM**.


Usage
-----

You can run shell like this:

    $ docker run --rm -t -i sylvainlasnier/ubuntu /bin/bash
    root@65b9aa83467b:/# lsb_release -a
    No LSB modules are available.
    Distributor ID:	Ubuntu
    Description:	Ubuntu 15.10
    Release:	15.10
    Codename:	wily
    root@65b9aa83467b:/# exit
    $

You can calculate the first thousand pi decimals:

    $ docker run --rm -ti sylvainlasnier/ubuntu
		root@60663e95f5c6:/# apt-get install -y -q bc
		Reading package lists...
		...
		root@60663e95f5c6:/# time echo "scale=1000; 4*a(1)" | bc -l
		3.141592653589793238462643383279502884197169399375105820974944592307\
		81640628620899862803482534211706798214808651328230664709384460955058\
		22317253594081284811174502841027019385211055596446229489549303819644\
		28810975665933446128475648233786783165271201909145648566923460348610\
		45432664821339360726024914127372458700660631558817488152092096282925\
		40917153643678925903600113305305488204665213841469519415116094330572\
		70365759591953092186117381932611793105118548074462379962749567351885\
		75272489122793818301194912983367336244065664308602139494639522473719\
		07021798609437027705392171762931767523846748184676694051320005681271\
		45263560827785771342757789609173637178721468440901224953430146549585\
		37105079227968925892354201995611212902196086403441815981362977477130\
		99605187072113499999983729780499510597317328160963185950244594553469\
		08302642522308253344685035261931188171010003137838752886587533208381\
		42061717766914730359825349042875546873115956286388235378759375195778\
		18577805321712268066130019278766111959092164201988
		
		real	0m0.356s
		user	0m0.352s
		sys	0m0.000s

You can extend this image for testing service. For example, test `nginx` web server:
    
    $ docker run --rm -ti -p 80 sylvainlasnier/ubuntu /bin/bash
    root@e183b281175e:/# aptitude install nginx -y
    ...
    root@e183b281175e:/# service nginx start
    * Starting nginx nginx                                                        [ OK ] 
    root@e183b281175e:/#
    
Test it from another terminal:
  
    sylvain@sla-vpcz21:~$ docker ps
		CONTAINER ID        IMAGE                   COMMAND             CREATED              STATUS              PORTS                          NAMES
		e183b281175e        sylvainlasnier/ubuntu   "/bin/bash"         About a minute ago   Up About a minute   192.168.99.114:32769->80/tcp   node1/admiring_varahamihira

		sylvain@sla-vpcz21:~$ curl -I 192.168.99.114:32769
    HTTP/1.1 200 OK
		Server: nginx/1.9.3 (Ubuntu)
		Date: Fri, 25 Dec 2015 10:37:00 GMT
		Content-Type: text/html
		Content-Length: 612
		Last-Modified: Fri, 25 Dec 2015 10:36:32 GMT
		Connection: keep-alive
		ETag: "567d1c30-264"
		Accept-Ranges: bytes

    sylvain@sla-vpcz21:~$ # This is Amazing!
    

And last but not least, you can build your own awesome VM based on this image.

I use these docker images in production and I assume update.
Have fun and try my other [docker images](https://hub.docker.com/u/sylvainlasnier/) ^^
