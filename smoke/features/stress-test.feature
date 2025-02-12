Feature: To test sync plugin performance and stability on different load

    Background:
    Given Project [TEST_NAMESPACE] is used

    Scenario: Test openshift-sync plugin performance and stability
      Given The jenkins pod is up and runnning
      When We Trigger multiple builds using oc start-build openshift-jee-sample
      And We scale down the pod count in the replication controller to "0" from "1"
      Then We delete some builds
      Then We check for jenkins master pod status to be "Ready"
      And verify sync plugin is able to reconcile the build state and delete the job runs associated with the builds we deleted