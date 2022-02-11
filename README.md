**About**

The purpose of this project is to develop a app using MVVM, and including unit tests.
The app process the Marvel API to display descriptions and images of the characters in the Marvel universe.
This project has been developed in Swift and no third party dependencies.

![alt text](https://github.com/piyush9087/MarvelApi/blob/master/character_list.png)

![alt text](https://github.com/piyush9087/MarvelApi/blob/master/character_details.png)

**Features**
* Characters list: displays a list of characters and their thumbnails.
* Character detail: displays a picture of a character and its full description.

         
**Technical details**

This app has been developed using an MVVM architectural pattern, which is a combination of the Model-View-ViewModel architecture, In this implementation, the binding between the Views and the ViewModels is done via protocol-delegation. The app has major Folders:
* The View Group, which contains the views.
* The ViewModel Group, which contains the business logic.
* The Repository Group, which contains the networking and data handling.
* The Common Group, which contains common functionality related to UI Part.
