local env = {
  name: std.extVar('qbec.io/env'),
  namespace: std.extVar('qbec.io/defaultNs'),
};
local p = import '../params.libsonnet';
local params = p.components.gitlabRunner;

std.native('expandHelmTemplate')(
  '../vendor/gitlab-runner',
  params.values,
  {
    nameTemplate: params.name,
    namespace: env.namespace,
    thisFile: std.thisFile,
    verbose: true,
  }
)
