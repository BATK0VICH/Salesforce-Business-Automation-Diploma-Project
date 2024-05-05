public without sharing class EmailMessagingService {
    public void logSendResults(final List<Messaging.SendEmailResult> sendResults) {
        Integer successCounter = 0;
        Integer failedCoutner = 0;

        for (Messaging.SendEmailResult sendResult : sendResults) {
            if (sendResult.isSuccess()) {
                successCounter++;
                continue;
            }

            failedCoutner++;
            final List<Messaging.SendEmailError> errors = sendResult.getErrors();
            for (Messaging.SendEmailError error : errors) {
                System.debug('[EmailMessagingService][logSendResults] Fail Target Object ID: ' + error.getTargetObjectId());
                System.debug('[EmailMessagingService][logSendResults] Fail Status Code: ' + error.getStatusCode());
                System.debug('[EmailMessagingService][logSendResults] Fail Message: ' + error.getMessage());
                System.debug('[EmailMessagingService][logSendResults] Fail Fields: ' + error.getFields());
            }
        }
    }
}