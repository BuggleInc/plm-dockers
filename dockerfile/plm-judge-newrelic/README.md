# Dockerfile for plm-judge-newrelic

This Dockerfile allows to build a new docker image based on buggleinc/plm-judge.

It overrides the ```CMD``` to use the [New Relic](https://newrelic.com/) agent to monitor the application.

This new docker image expects a new volume to be mounted at */app/judge/newrelic*.
This folder should contain the **New Relic Java Agent** and its configuration files.
