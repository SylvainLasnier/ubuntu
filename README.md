Ubuntu 14.04 LTS Docker image
=============================

Description
-----------

This image is the root of all my other docker images. It is small and basic.

It includes fresh installation of Ubuntu 14.04 LTS distribution, english language, universe apt packages and some basic common packages: vim-tiny editor, curl to use webservices and supervisor to run easily more process in Docker VM.  

So, this image respects pragmatic simple vision of Docker image.  
If you are looking for a complete VM, just use LXC.  
LXC is an awesome product to get fast full VM where Docker is awesome to get only one service.


Usage
-----

You can run shell like this:

    $ docker run --rm -t -i sylvainlasnier/ubuntu /bin/bash
    root@65b9aa83467b:/# lsb_release -a
    No LSB modules are available.
    Distributor ID:	Ubuntu
    Description:	Ubuntu 14.04 LTS
    Release:	14.04
    Codename:	trusty
    root@65b9aa83467b:/# exit
    $

You can run another process. Here, I ask to the docker vm to calculate the first thousand pi decimals:

    $ time docker run --rm sylvainlasnier/ubuntu echo "scale=1000; 4*a(1)" | bc -l 
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
    
    real	0m0.521s
    user	0m0.362s
    sys	0m0.014s
    $
    
You can build awesome VM based on this image
    

Have fun and try my other images ^^
