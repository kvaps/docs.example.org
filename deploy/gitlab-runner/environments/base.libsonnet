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
      },
    },
  },
}
