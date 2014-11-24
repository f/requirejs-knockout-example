require.config
  baseUrl: './dist'
  paths:
    knockout: '../node_modules/knockout/build/output/knockout-latest'
    jquery: '../node_modules/jquery/dist/jquery'

    # Widgets
    'carousel.widget': 'widgets/carousel/carousel'
    'buynow.widget': 'widgets/buynow/buynow'

    # Apps
    'index.app': 'apps/index'
