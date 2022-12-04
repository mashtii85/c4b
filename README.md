# c4b

A new Flutter code challenge project with authentication and show a page view list.

## Getting Started
What you see in this project are what I have learnt during 3 years of my experience with flutter. I would be glad to in case of any suggestion.

After authentication successfully you can see a list of products.
If we pass incorrect username and password, we will be notified by snackbar. 
If the token life time ended, app would navigate to authorize screen.

## Naming Convention
Folders follows underscore pattern and exported classes follows camelCase.
Almost all folders name are plural.
Every model has two sub folders for request and response. Response models are suffixed with 'ResModel' for example 'BaseResModel'
Request models are suffixed with 'ReqModel' for example 'CredentialsReqModel'.

## Structure
- api_service
- assets
- components
- common
- products
- config
- extensions

### api_service
- constants
  Constants related to this service.
- formatters
  formatter for query string for get http response  
- models
  - BaseResModel<T>
    All responses normalize with this type and converted into this model. 
    Fields:
    - success: boolean
      if http response succeed or failed
    - message: [MessageResModel]
      list of MessageResModels to show any kind of messages
    - payloads: Map<String,dynamic>
      body of HTTP Response
    - payloadsObjects [T type](generic)
      converted payloads with correspondent T model
  - messageResModel
    consist of `title`, `text` and `description` to show message
- api_service
  A factory which every repository that needs to work with HTTP, instantiate it. 
- api_urls
  Every component has it's own url inside this class to avoid repetition and also make use of constants variables
- fixtures
  Is a part of `api_service` which acts as a helper. Some `api_service` implementation lived inside this file.
### Assets
All assets consist of fonts and images

### Components
Every component consist of:
- cubits
  - cubits
    This project utilize bloc state management. Cubits stay between Widgets and repository
  - states
    Every cubit has a part named state beside lives beside. States are responsible to change ui based on cubit's logic.
  - repository
    Operations such as CRUD and/or working with shared preference has written in this layer. PayloadObject get prepared by converting json payload. 
    Repositories are injected into cubits so in case of testing we could mock it.
  - daos
    Any operation which need to access shared preference has written inside `daos` and eventually they inherited by correspondent repository
- models
  Are the same as models inside `api_serve`
- screens
  Any partial or complete page are in this folder. Screens which are using cubit are stateful so we can close cubit on dispose lifecycle. It would be better if we can use an HOC to have cubit and automatically dispose it. In this way we won't need stateful widget. I would prefer to use hooks if I wanted to refactor it.

- Authentication
  Consist of authentication and authorization. They instantiated in main function so they can act as observer and their states provided within all app. 

- Common
  Components like FailurePage, Loading, that are reused and have common usability are in this folder.

- Products
  Show a list of products after user authenticated. Every time it shows 10 items of product and as soon as scroll reached the end of the page another 10 items are added.

- Config
  - theme
    To have application to have consistent UI and follow an integrated UI we need to follow theme constants. In this way for example if our card UI change, then we are supposed to change it only in one place. I separated project theme and every sub section into it's own file.
  - bloc_observer
    To follow which state our app to debug it I utilize observer on bloc. It triggers new state as soon as it changed nevertheless we need to write lots of print command.
  - constants
    A factory which get hold of every constant values.
  - context_provider
    When the app runs required field from local storage and credentials passed to it so it could provide values for every module
  - fixture_provider
    Just like context_provider except it make hold of widgets, or theming data, like margin.
  - extensions
    Extension method can provide extra functionality by extending current object. For example if we want to have a comma separated for currency values we can extend int type.
    Suppose `curreny` with value 1000, variable that after adding extension we can have `currency.commaSeparated()` with value '1,000'
  - main
    On main function I provide userRepository so we can read its value and instantiate it once. Also bloc observer get started from here.
    My app is accessible via this function
  - app
    In here I instantiated authorization and authentication cubit. which feeds from cubits in this file by reading context. 
    
