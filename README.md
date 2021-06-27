

# ACE Pipeline
![Image](https://github.com/hindos/ACE/blob/master/images/hello-world-pipeline1.PNG)
### Create Github Secret

```
oc create -f secret-ibm-git-credentials.yaml
```
### Create Openshift Secret

```
oc create -f secret-openshift-access.yaml
```

### Create Registry Secret
```
oc create -f secret-ibm-registry-access.yaml

```
### Create Webhook Secret
```
oc create -f secret-webhook-secret.yaml

```
### Create ConfigMap to define environments
```
oc create -f configmap-environments.yaml

```

### Create a TriggerTemplate
Create a TriggerTemplate to run the task-run-pipeline task.  
A TriggerTemplate is a resource that specifies a blueprint for the resource, such as a TaskRun or PipelineRun, that you want to instantiate and/or execute when your EventListener detects an event. It exposes parameters that you can use anywhere within your resource's template.
```
oc create -f triggertemplate-ace-pipeline-trigger.yaml

```
### Create a TriggerBinding
Create a TriggerBinding to get fields like repository name, repository url and the head_commit id from the push event.    
As per the name, TriggerBindings bind against events/triggers. TriggerBindings enable you to capture fields from an event and store them as parameters. The separation of TriggerBindings from TriggerTemplates was deliberate to encourage reuse between them.

```
oc create -f triggerbinding-trigger-binding-github.yaml

```
### Create EventListener
EventListener is a Kubernetes custom resource that allows users a declarative way to process incoming HTTP based events with JSON payloads. EventListeners expose an addressable "Sink" to which incoming events are directed. Users can declare TriggerBindings to extract fields from events, and apply them to TriggerTemplates in order to create Tekton resources. In addition, EventListeners allow lightweight event processing using Event Interceptors.
```
oc create -f eventlistener-ace-builder.yaml
```
### Update pipeline ServiceAccount
Add the all-icr-io secret in the imagePullSecrets
```
oc create -f serviceaccount-pipeline.yaml
```
## Create Tasks
### Create the task-run-pipeline task
```
oc create -f task-task-run-pipeline.yaml
```
### Create the generic-setup task

```
oc create -f task-generic-setup.yaml

```
### Create the generic-build task
```
oc create -f task-generic-build.yaml

```
### Create the ace-deploy task
```
oc create -f task-ace-deploy.yaml
```
## Create ACE Pipeline
```
                               
oc create -f pipeline-new-ace-pipeline.yaml
```
## Create ACE PipelineRun
```
                               
oc create -f pipelineRun.yaml
```



