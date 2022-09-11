[33mcommit 24ee7061d2e091a4a43792345ffb7788d758a549[m[33m ([m[1;36mHEAD -> [m[1;32mdev[m[33m, [m[1;31morigin/dev[m[33m)[m
Author: hari Thanneeru <harit.naidu@gmail.com>
Date:   Sun Sep 11 07:06:34 2022 +0530

    ansible variable

[1mdiff --git a/ansible/ansible-variable.yaml b/ansible/ansible-variable.yaml[m
[1mnew file mode 100644[m
[1mindex 0000000..a641c21[m
[1m--- /dev/null[m
[1m+++ b/ansible/ansible-variable.yaml[m
[36m@@ -0,0 +1,6 @@[m
[32m+[m[32m---[m
[32m+[m[32m- hosts: localhost[m
[32m+[m[32m  tasks:[m
[32m+[m[32m  - name: Environment variable display in ansible[m
[32m+[m[32m    debug:[m
[32m+[m[32m      msg: "{{ ansible_env }}"[m
\ No newline at end of file[m
