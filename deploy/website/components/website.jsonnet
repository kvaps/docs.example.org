local env = {
  name: std.extVar('qbec.io/env'),
  namespace: std.extVar('qbec.io/defaultNs'),
};
local p = import '../params.libsonnet';
local params = p.components.website;

[
  {
    apiVersion: 'apps/v1',
    kind: 'Deployment',
    metadata: {
      labels: { app: params.name },
      name: params.name,
    },
    spec: {
      replicas: params.replicas,
      selector: {
        matchLabels: {
          app: params.name,
        },
      },
      template: {
        metadata: {
          labels: { app: params.name },
        },
        spec: {
          containers: [
            {
              name: 'darkhttpd',
              image: params.image,
              ports: [
                {
                  containerPort: params.containerPort,
                },
              ],
            },
          ],
          nodeSelector: params.nodeSelector,
          tolerations: params.tolerations,
          imagePullSecrets: [{ name: 'regsecret' }],
        },
      },
    },
  },
  {
    apiVersion: 'v1',
    kind: 'Service',
    metadata: {
      labels: { app: params.name },
      name: params.name,
    },
    spec: {
      selector: {
        app: params.name,
      },
      ports: [
        {
          port: params.servicePort,
          targetPort: params.containerPort,
        },
      ],
    },
  },
  {
    apiVersion: 'extensions/v1beta1',
    kind: 'Ingress',
    metadata: {
      annotations: {
        'kubernetes.io/ingress.class': params.ingressClass,
      },
      labels: { app: params.name },
      name: params.name,
    },
    spec: {
      rules: [
        {
          host: params.domain,
          http: {
            paths: [
              {
                backend: {
                  serviceName: params.name,
                  servicePort: params.servicePort,
                },
              },
            ],
          },
        },
      ],
    },
  },
]
