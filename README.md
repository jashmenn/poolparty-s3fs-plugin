poolparty-s3fs-plugin
=====================

Goal
====
Install and mount s3fs volume on an ec2 instance.

Usage
=====
*NOTICE* You must have already created your S3 bucket. This plugin will *not*
create it for you.

    cloud(:app)
      ...
      s3fs(:bucket => "my-fun-bucket")
      ...
    end

This will be mounted at `/mnt/my-fun-bucket`
You can mount multiple buckets and/or change the mount point:

    s3fs do 
      bucket "my-fun-bucket"
      bucket "my-other-bucket", "/mnt/a-disk"
    end

References:
==========
 * http://code.google.com/p/s3fs/wiki/FuseOverAmazon
 * http://groups.google.com/group/ec2ubuntu/browse_thread/thread/9093236bc07d220b?pli=1

Credit:
=======
Plugin written by Nate Murray

Installation instructions by Eric Hammond 

LICENSE:
=======
(The MIT License)
 
Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:
 
The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.
 
THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
