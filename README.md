# OpenFaaS on Cloud Run

Ever got curious about [OpenFaaS](https://www.openfaas.com), the open alternative to [Cloud Run](https://cloud.google.com/run)? So was I! The problem is: You will want some kind of cluster or VM to actually run your functions-as-a-service. Just so happens that (ironically) you can use Cloud Run to run OpenFaaS without setting any of those heavier bits up. While this specific use-case can seem convoluted—you'd probably want OpenFaaS to actually get out of the big clouds—this is at least a concise, short, minimal way of understanding how OpenFaaS works.

The approach here is to handle bundling and building on your machine, and then sending off a complete image for Cloud Run to deploy.

## Prerequisites

- You have access to Google Cloud Platform
- You have sufficient privileges to push images to GCP and run them on Cloud Run
- You have enabled APIs for at least Cloud Run (possibly also Container/Artifact Registry)
- You have `gcloud` installed
- You have `faas-cli` installed
- You have Docker installed
- You have checked and set variables in `deploy.sh`

## Developing with the approach provided

The application definition is done in `stack.yml`.

The actual function handler is in `src/handler.js`. Refer to [https://docs.openfaas.com/cli/templates/#nodejs-12-node12-of-watchdog-template](https://docs.openfaas.com/cli/templates/#nodejs-12-node12-of-watchdog-template) for how these Node 12 functions work.

## Deploy

Run `sh deploy.sh` (FYI it's Mac-oriented) to shrinkwrap the application with `faas-cli`, build it locally, push it to GCP, and then deploy it.

## References

- [Run your OpenFaaS Functions on Google Cloud Run for free](https://www.openfaas.com/blog/openfaas-cloudrun/)
- [Serverless Node.js that you can run anywhere](https://www.openfaas.com/blog/serverless-nodejs/)
