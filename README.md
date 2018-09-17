Run a scheduled task on AWS Batch using Ansible and Docker.

## Dependencies:

- [awscli](https://aws.amazon.com/cli/)

## Default Configuration:

* Concurrency restricted to one at a time by limiting the resources of the ComputeEnvironment. (Job `vCpus: 2` // Default Environment `MaxvCpus: 2`)
* Ansible Playbook notifies Slack at job start and at job failure/success and sends failure/success notification to Datadog.
* Job names are random. This can be modified in `cfn/batch-scheduled-task.template` by assigning a static value to job1Name in line 161.

## Prepare

1.) Clone the repo

`git clone https://github.com/evfurman/batch-scheduled-task`

2.) Edit `batch-scheduled-task.yml` to add your own tasks

3.) Add Slack token, and Datadog token/app keys to vars in `batch-scheduled-task.yml`

4.) Add hosts under `[cluster_members]` in `hosts.ini`

5.) Build and push docker image to a *private* repository

6.) Add new image and tag to `cfn/batch-scheduled-task.template` on line 100

## Deploy

`cd cfn && ./deploy.sh`
