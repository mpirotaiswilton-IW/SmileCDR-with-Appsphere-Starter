# SmileCDR-with-Appsphere-Starter
A running configuration for a dockerized SmileCDR image with an appsphere module set up

## Summary

[SmileCDR-with-Appsphere-Starter](#smilecdr-with-appsphere-starter)
* [Summary](#summary)
* [Pre-requisites](#pre-requisites)
* [Setup](#setup)
* [Running SmileCDR Locally](#running-smilecdr-locally)
* [Verifying our container](#verifying-our-container)
    * [Accessing the Admin Web page](#accessing-the-admin-web-page)
    * [Accessing the Appsphere Web page](#accessing-the-appsphere-web-page)

## Pre-requisites

1. If not already installed/acquired:

- Acquire a copy of a SmileCDR image version `2024.02.R04`
- Install Docker on your device (you can use the following link for a guide: [https://docs.docker.com/get-docker/](https://docs.docker.com/get-docker/))

2. Clone this repository or download the .zip file from GitHub (extract the downloaded zip file)

## Setup

Before running SmileCDR, you will need to modify the `Dockerfile` used to build the container used. The code snippet below shows where you should enter your local image:tag (replace `<imagename>` and `<imagetag>`):
``` Dockerfile
# Use base Smile CDR image as parent image. 
# Change this if the field entry does not match your local SmileCDR image
FROM <imagename>:<imagetag>
```

## Running SmileCDR Locally

1. Using a Command Line Interface of your choosing, change directory to the downloaded/cloned repository


3. Run this command to deploy SmileCDR:

    ```
    docker-compose up -d --build
    ```

4. 1 docker containers should now be running:
    * `smilecdr-app.local`

5. This container will take a few minutes to setup. You can check its logs in real time using the following command: 
    ```
    docker container logs -f smilecdr-app.local
    ```

Once the logs display the following text, you are ready to go:
```
INFO  M: R: ca.cdr.app.AppLauncher - Smile, we're up and running! :)
```
## Verifying our container

### Accessing the Admin Web page

To access the Admin Web page, go to <localhost:9100> on a browser of your choice, you will be greeted with a sign-in page where you can use the default admin credentials.

After successfully signing in, you will be redirected to the module config page. On the left hand side of the page, you should see a side bar with a list of modules, sorted into the Master node. Under the `Administrative Modules` header, you should see a module named `app_galery` with the port `9300`

At the top of the web page, you should see a header bar. From here:
1. Click on `User & Authorization > OpenId Connect Clients`
2. You should see  single item in a list with the name "App-Gallery"

### Accessing the Appsphere Web page

To access the Admin Web page, go to <localhost:9300> on a browser of your choice, you will be greeted with a page with 3 links: 

* Admin Console
* Developer Console
* Application Gallery

The first 2 pages will require authentication to use, where you may re-use the credentials above. The Application Gallery can be accessed without signing in. 

The Developer Console will require you to set up a developer account associated with the submited credentials. For testing purposes, you may enter the following mock entries:

* `Drop-down list`: `I am an individual`
* `Legal Full Name`: `John Doe`
* `Address Line 1`: `123 Test Street`
* `City`: `San Francisco`
* `State/Region`: `California`
* `Zip/Postal Code`: `94110`
* `Country`: `United States`
* `Work Phone`: `+1` `800-444-4444` (Courtesy of <https://se.au/resources/test-phone-numbers/>)

From there, you will have full access to play around with the Developer Portal as John Doe.