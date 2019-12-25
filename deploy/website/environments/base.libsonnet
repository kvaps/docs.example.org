// this file has the baseline default parameters
{
  components: {
    website: {
      name: 'example-docs',
      image: 'registry.gitlab.com/kvaps/docs.example.org/website@' + std.extVar('digest'),
      replicas: 1,
      containerPort: 80,
      servicePort: 80,
      nodeSelector: {},
      tolerations: [],
      ingressClass: 'nginx',
      domain: 'docs.example.org',
    },
  },
}
