# imovie-app

## Project Structure
- **Frontend**: Located in `/frontend` directory. It is an Angular project.
- **Backend**: Located in `/backend` directory. It is a Spring Boot project.

## How to Run the Projects

### Backend (Spring Boot)
1. Navigate to the backend directory of the desired microservice, e.g., `cd backend/PaymentMS`.
2. Run the following command to build and start the Spring Boot application:
   ```
   ./mvnw spring-boot:run
   ```
3. The application will start on the port specified in the `application.yml` file.

### Frontend (Angular)
1. Navigate to the frontend directory:
   ```
   cd frontend/iMovie
   ```
2. Install the dependencies:
   ```
   npm install
   ```
3. Start the Angular development server:
   ```
   ng serve
   ```
4. Open your browser and navigate to `http://localhost:4200` to view the application.
