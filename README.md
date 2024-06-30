## FNS Project Setup Guide

Welcome to the FNS project! This guide will walk you through the steps required to set up and run the project locally. The project consists of multiple components organized into different folders as follows:

### Folder Structure

1.  **api**: Node.js project using Express.js
2.  **frontend**: Flutter project
3.  **fsn-admin**: Next.js project
4.  **docker**: Contains `docker-compose.yml` file

### Prerequisites

- Docker
- Flutter SDK
- MySQL Server

### Step-by-Step Setup Instructions

#### 1\. Setting Up MySQL Server

Ensure you have MySQL Server installed and running on your local machine. You will need the following details:

- MySQL username
- MySQL password
- MySQL database name

#### 2\. Running Docker Containers

Navigate to the `docker` folder and run the following command to start the admin, api, and MySQL containers:

`docker compose -p fsn up -d`

This command will bring up the necessary services for the project.

#### 3\. Setting Up and Running the Flutter Frontend

Navigate to the `frontend` folder and follow these steps:

##### 3.1. Install Flutter

If you do not have Flutter installed, follow the official Flutter installation guide: Flutter Installation

##### 3.2. Check Flutter Setup

Run the following command to ensure Flutter is set up correctly:

`flutter doctor`

##### 3.3. Install Dependencies

Run the following command to install the necessary dependencies for the project:

`flutter pub get`

##### 3.4. Run the Flutter Application

To run the Flutter application, use the following command:

`flutter run`

You might need to specify the device if multiple devices are connected. You can list connected devices using:

`flutter devices`

Then run the application on a specific device:

`flutter run -d <device_id>`

Replace `<device_id>` with the appropriate device ID from the list.

#### 4\. Running the Admin Panel

Navigate to the `fsn-admin` folder and follow these steps:

##### 4.1. Install Dependencies

Make sure you have Node.js and npm installed. Then run the following command to install the necessary dependencies:

`npm install`

##### 4.2. Run the Next.js Application

To start the Next.js application, use the following command:

`npm run dev`

This will start the admin panel on the local development server.

### Conclusion

You should now have all components of the FNS project running locally. If you encounter any issues, please refer to the respective documentation for each technology stack used in the project.

Happy coding!
