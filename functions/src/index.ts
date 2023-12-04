/**
 * Import function triggers from their respective submodules:
 *
 * import {onCall} from "firebase-functions/v2/https";
 * import {onDocumentWritten} from "firebase-functions/v2/firestore";
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

import {onRequest} from "firebase-functions/v2/https";
import * as logger from "firebase-functions/logger";

// The Cloud Functions for Firebase SDK to create Cloud Functions and triggers.
//const {logger} = require("firebase-functions");
//const {onRequest} = require("firebase-functions/v2/https");
//const {onDocumentCreated} = require("firebase-functions/v2/firestore");

// The Firebase Admin SDK to access Firestore.
const {initializeApp} = require("firebase-admin/app");
//const {getFirestore} = require("firebase-admin/firestore");

initializeApp();


// Start writing functions
// https://firebase.google.com/docs/functions/typescript

 export const helloWorld = onRequest((request, response) => {
   logger.info("Hello logs!", {structuredData: true});
   response.send("Hello from Firebase!");
 });


