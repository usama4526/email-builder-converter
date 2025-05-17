# NGX Email Builder Converter

This application is part of the [NGX Email Builder](https://ngb.email) project. The **NGX Email Builder** is a tool that allows users to create emails using a drag-and-drop interface.

The main scope of project is to convert [IPEmail](https://github.com/wanoo21/ngb.email) to [MJML](https://mjml.io/) and renders them to HTML, but it has other things like:

- A list of [ready-to-use templates](./templates)
- An experimental feature to [convert MJML to IPEmail](./mjml-to-email)
- An easy way to generate a [template's thumbnail](./generate-thumbnails.ts)
- A way to [generate the templates list](./generate-template-json.ts)
- A way to test the templates (probably later)

## How it works

The application is built using [Express](https://expressjs.com/) and [MJML](https://mjml.io/). It exposes some endpoints that allow you to convert IPEmail to MJML and render it to HTML.

There are two-way to convert IPEmail to HTML:
- [Running the application locally](#run-locally) and sending a POST request to the `/` endpoint with the IPEmail as the body. See how to do it [here](./server.ts).
- Using the [NPM package](https://www.npmjs.com/package/@wlocalhost/ngx-email-builder-convertor) and calling the `convertIPEmail` function. See how to use it [here](https://github.com/wanoo21/ngb.email/blob/cf475f278f5ae6dcac527feda24fea284170eb44/apps/root/server.ts#L25).

## Run locally

First make sure you have [Node.js](https://nodejs.org/en/) installed globally.

This project uses [pnpm](https://pnpm.io/) as the package manager. To install `pnpm`, you can run the following command:

```bash
npm install -g pnpm
```

To run the application locally, follow these steps:

```bash
pnpm install
// for production
pnpm start
// for development
pnpm dev
```

Then you can access the application by visiting <http://localhost:3000/ping> in your web browser.

## Run Docker container

To build the image, you can run the following command from the directory where the `Dockerfile` is located:

```bash
docker build -t angular-mjml-output .
```

Replace `angular-mjml-output` with the desired name for your image.

To run the container, you can use the following command:

```bash
docker run -p 3000:3000 angular-mjml-output
```

This will start the container and bind port 3000 on the host machine to port 3000 on the container. This allows you to access the application by visiting <http://localhost:3000/ping> in your web browser.

## Run Docker container with Docker Compose

This docker-compose.yml file does the following:

* Defines a single service called **angular-mjml-output**.
* Builds the **angular-mjml-output** service using the `Dockerfile` in the current directory `(.)`.
* Maps port `3000` on the host machine to port `3000` on the container.
* Sets the `restart` policy for the app service to `always`, which means that the container will be automatically restarted if it stops or crashes.

To build and run the containers, you can use the following command:

```bash
docker-compose up
```

This will build the image and start the container, and you should be able to access the Express application by visiting <http://localhost:3000/ping> in your web browser.
