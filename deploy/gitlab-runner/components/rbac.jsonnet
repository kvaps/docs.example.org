local env = {
  name: std.extVar('qbec.io/env'),
  namespace: std.extVar('qbec.io/defaultNs'),
};
local p = import '../params.libsonnet';
local params = p.components.rbac;

[
  {
    apiVersion: 'v1',
    kind: 'ServiceAccount',
    metadata: {
      labels: {
        app: params.name,
      },
      name: params.name,
    },
  },
  {
    apiVersion: 'rbac.authorization.k8s.io/v1',
    kind: 'Role',
    metadata: {
      labels: {
        app: params.name,
      },
      name: params.name,
    },
    rules: [
      {
        apiGroups: [
          '*',
        ],
        resources: [
          '*',
        ],
        verbs: [
          '*',
        ],
      },
    ],
  },
  {
    apiVersion: 'rbac.authorization.k8s.io/v1',
    kind: 'RoleBinding',
    metadata: {
      labels: {
        app: params.name,
      },
      name: params.name,
    },
    roleRef: {
      apiGroup: 'rbac.authorization.k8s.io',
      kind: 'Role',
      name: params.name,
    },
    subjects: [
      {
        kind: 'ServiceAccount',
        name: params.name,
        namespace: env.name,
      },
    ],
  },
]
