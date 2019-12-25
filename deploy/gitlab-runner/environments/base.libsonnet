// this file has the baseline default parameters
local secrets = import '../secrets/base.libsonnet';

{
  components: {
    gitlabRunner: {
      name: 'gitlab-runner',
      values: {
        gitlabUrl: 'https://gitlab.com/',
        rbac: {
          create: true,
        },
        runnerRegistrationToken: secrets.runnerRegistrationToken,
        runners: {
          serviceAccountName: $.components.rbac.name,
          image: 'registry.gitlab.com/kvaps/docs.example.org/toolbox:v0.0.1',
        },
      },
    },
    rbac: {
      name: 'gitlab-runner-deploy',
    },
  },
}
