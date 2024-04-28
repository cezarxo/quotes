# quotes

Quotes App

## Getting Started
This is a simple flutter project called quotes app. it's using open source API to get random quotes when pressing on the refresh button.
I used flutter clean architecher to master this project in a way it can be used multiple times. Using Cubit as a state management for the project and dart packages to extend the simplicity of this project.
The project structre is as follows:

‣ lib
  ‣ main.dart
  ‣ app.dart
  ‣ bloc_observer.dart
  ‣ injector.dart
  ‣ config
    ‣ locale
     ‣ app_localizations.dart
     ‣ app_localizations_delegate.dart
     ‣ app_localizations_setup.dart
    ‣ routes
     ‣ app_routes.dart
    ‣ themes
     ‣ app_theme.dart
   ‣ core
    ‣ api
     ‣ api_consumer.dart
     ‣ app_interceptor.dart
     ‣ dio_consumer.dart
     ‣ endpoint.dart
     ‣ status_code.dart
    ‣ error
     ‣ exception.dart
     ‣ failures.dart
    ‣ network
     ‣ network_info.dart
    ‣ usecases
     ‣ usecase.dart
    ‣ utils
     ‣ app_colors.dart
     ‣ app_strings.dart
     ‣ assets_manager.dart
     ‣ constants.dart
     ‣ hex_color.dart
     ‣ media_query_values.dart
    ‣ widgets
     ‣ error_widget.dart
  ‣ src
    ‣ random_quotes
     ‣ data
      ‣ datasources
       ‣ get_random_quote_local.dart
       ‣ get_random_quote_remote.dart
      ‣ models
       ‣ quote_model.dart
      ‣ repositories
       ‣ quote_repository_imp.dart
     ‣ domain
      ‣ entities
       ‣ quote.dart
      ‣ repositories
       ‣ quote_repository.dart
      ‣ usecases
       ‣ get_random_quote.dart
     ‣ presentation
      ‣ cubit
       ‣ random_quotes_cubit.dart
       ‣ random_quotes_state.dart
      ‣ views
       ‣ quotes_view.dart
      ‣ widgets
       ‣ quote_content.dart
    ‣ splash
     ‣ data
      ‣ datasources
       ‣ lang_local_data_source.dart
      ‣ repositories
       ‣ lang_repository_impl.dart
     ‣ domain
      ‣ repositories
       ‣ lang_repository.dart
      ‣ usecases
       ‣ change_lang.dart
       ‣ get_saved_lang.dart
     ‣ presentation
      ‣ cubit
       ‣ locale_cubit.dart
       ‣ locale_state.dart
      ‣ screens
       ‣ splash_screen.dart
    

