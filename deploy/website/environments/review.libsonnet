// this file has the param overrides for the default environment
local base = import './base.libsonnet';
local slug = std.extVar('qbec.io/tag');
local subdomain = std.extVar('subdomain');

base {
  components+: {
    website+: {
      name: 'example-docs-' + slug,
      domain: subdomain + '.docs.example.org',
    },
  },
}
