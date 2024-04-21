public without sharing class LeadTriggerHandler extends AbstractTriggerHandler {
    private EmailTemplateSelector emailTemplateSelector = new EmailTemplateSelector();
    private EmailMessagingService emailMessagingService = new EmailMessagingService();

    public LeadTriggerHandler(
        final List<Lead> newLeads,
        final Map<Id, Lead> oldLeadsByIds
    ) {
        super(newLeads, oldLeadsByIds);
    }

    public override void handleAfterInsert() {
        this.sendWelcomeEmails();
    }

    public void sendWelcomeEmails() {
        final List<EmailTemplate> welcomeEmailTemplate = emailTemplateSelector.selectByDeveloperNames(
            new Set<String>{
                EmailTemplates.WELCOME_EMAIL_TEMPLATE_DEVELOPER_NAME
            }
        );

        System.debug('[LeadTriggerHandler][sendWelcomeEmails] welcomeEmailTemplate: ' + JSON.serialize(welcomeEmailTemplate));

        if (welcomeEmailTemplate.isEmpty()) {
            return;
        }

        final List<Messaging.SingleEmailMessage> welcomeEmailMessages = constructEmailMessages(
            welcomeEmailTemplate.get(0)
        );
        System.debug('[LeadTriggerHandler][sendWelcomeEmails] welcomeEmailMessages: ' + JSON.serialize(welcomeEmailMessages));

        if (welcomeEmailMessages.isEmpty()) {
            return;
        }

        try {
            final List<Messaging.SendEmailResult> sendResults = Messaging.sendEmail(welcomeEmailMessages, false);
            emailMessagingService.logSendResults(sendResults);
        } catch (Exception e) {
            System.debug(e.getMessage() + '\n' + e.getStackTraceString());
        }
    }

    public List<Messaging.SingleEmailMessage> constructEmailMessages(
        final EmailTemplate emailTemplate
    ) {
        List<Messaging.SingleEmailMessage> welcomeEmailMessages = new List<Messaging.SingleEmailMessage>();

        for (Lead newLead : (List<Lead>) this.getNewRecords()) {
            final List<String> toAddress = new List<String>{ newLead.Email };
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setTemplateId(emailTemplate.Id);
            mail.setHtmlBody(emailTemplate.HtmlValue);
            mail.setToAddresses(toAddress);
            mail.setSubject(emailTemplate.Subject);
            mail.setTargetObjectId(newLead.Id);
            mail.setSaveAsActivity(false);
            mail.setUseSignature(false);
            welcomeEmailMessages.add(mail);
        }

        return welcomeEmailMessages;
    }
}
