// @ts-nocheck
import { ApplyPluginsType } from 'C:/Users/15313/AppData/Roaming/npm/node_modules/umi/node_modules/@umijs/runtime';
import { plugin } from './plugin';

const routes = [
  {
    "path": "/",
    "exact": true,
    "component": require('@/pages/index.js').default
  },
  {
    "path": "/users",
    "exact": true,
    "component": require('@/pages/users.js').default
  }
];

// allow user to extend routes
plugin.applyPlugins({
  key: 'patchRoutes',
  type: ApplyPluginsType.event,
  args: { routes },
});

export { routes };
