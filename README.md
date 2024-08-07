# blade-nav.nvim
Navigating Blade views and routes within Laravel projects

`blade-nav.nvim` is a Neovim plugin designed to enhance navigation within 
Laravel projects. It allows quick access to Blade files and their corresponding
classes, and enables navigation to the controller associated with a route name.
This plugin simplifies moving between controllers, routes, Blade views, and
components in Laravel applications.

## In a Blade file

![x-livewire](https://github.com/RicardoRamirezR/blade-nav.nvim/assets/6526545/8e10106f-d28e-40dc-b0df-c45f0f842980)

## From Controller and Routes

![gf-view](https://github.com/RicardoRamirezR/blade-nav.nvim/assets/6526545/e6ddb3ec-829f-4055-b8d1-581635bfb18c)

<p align="center">
    <a href="https://dotfyle.com/plugins/RicardoRamirezR/blade-nav.nvim">
        <img src="https://dotfyle.com/plugins/RicardoRamirezR/blade-nav.nvim/shield" />
    </a>
</p>

## Navigation

### From Blade Files

- Navigate to the parent view using `@extends('name')`
- Navigate to included views using `@include('name')`
- Open Laravel components using `<x-name />`
- Open Livewire components using `<livewire:name />` or `@livewire('name')`

### From Controllers and Routes:

Open Blade views from controller or route definitions like 
- `Route::view('url', 'name')`
- `View::make('name')`
- `view('name')`

### From any PHP or Blade file:
- Open the controller associated with the route name: `route('name')`

## Features

- Utilizes the `gf` (goto file) command for navigation.
- Provides a custom source for [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
  (requires installation and configuration) for component selection.
- Provides a custom source for [coq](https://github.com/ms-jpq/coq_nvim) (requires
  installation and configuration).

## Installation

To get started with `blade-nav.nvim`, add the plugin to your `init.lua` or `init.vim` file:

**Using packer**:

```lua
use {
    'ricardoramirezr/blade-nav.nvim',
    requires = {
        'hrsh7th/nvim-cmp', -- if using nvim-cmp
        { "ms-jpq/coq_nvim", branch = "coq" }, -- if using coq
    },
    ft = {'blade', 'php'}
}
```
    
**Using lazy**:

```lua
{
    'ricardoramirezr/blade-nav.nvim',
    dependencies = {
        'hrsh7th/nvim-cmp', -- if using nvim-cmp
        { "ms-jpq/coq_nvim", branch = "coq" }, -- if using coq
    },
    ft = {'blade', 'php'} -- optional, improves startup time
}
```

## Usage

1. **To navigate to a Blade file or its corresponding class**:
   
    If the file does not exist and is in a subfolder that does not exist yet,
    you should create the directory, it can be done writing the file using `++p`  

    > The "++p" flag creates the parent directory of the file if it does not exist.
    > For example if you edit "foo/bar/file.txt", the ":write ++p" command creates
    >"foo/bar/" if necessary before writing the file.

  - Place the cursor over the file name and use the `gf` command.
    - If the component view exists but there is no corresponding class, it 
    opens the view file.
    - If the class exists but not its view, the class is opened.
    - If neither exists and is a Livewire component, it presents the option to
    create the component using `php artisan make:livewire`.
    - If neither exists and is a Blade component, it can present two or three
    options, depending on the component type. The options are, create the view
    component and cretate the component via `php artisan make:component`. A
    third option will be presented if you want to create an Anonymous Index Component.

2. **To navigate to a controller associated with a route name**:
    - Place the cursor over the route name and use the `gf` command.

3. **Select an existing resource using the custom source**, write either:
  - in a Blade file:
    - `@extends`
    - `@include`
    - `<x-`
    - `<livewire`
    - `@livewire`

  - in a Controller or Route:
    - `Route::view('url', 'name')`
    - `View::make('name')`
    - `view('name')`

  - in any PHP or Blade file (coq only):
    - `route('`

    And the list of files will appear, and with the magic of completion the
    list if filtered while you write. For coq, `coq_settings.match.max_results`
    limits the result shown.
    
## Configuration

No additional configuration is required. The plugin works out-of-the-box with the default `gf` command.

## Example

To navigate from a controller to a Blade view:
```php
public function show()
{
    return view('welcome');
}
```

Place the cursor on 'welcome' and press `gf` to open the resources/views/welcome.blade.php file.

## Contributing

Feel free to submit issues or pull requests to enhance the functionality of this plugin.

## License

This plugin is open-source and distributed under the MIT License. See the LICENSE file for more details.

## Acknowledgments

Special thanks to the Neovim and Laravel communities for their continuous support and contributions.
