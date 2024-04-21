public without sharing class EmailTemplateSelector {
    public List<EmailTemplate> selectByDeveloperNames(
        final Set<String> developerNames
    ) {
        if (developerNames == null || developerNames.isEmpty()) {
            return new List<EmailTemplate>();
        }

        return [
            SELECT Id, Subject, HtmlValue
            FROM EmailTemplate
            WHERE DeveloperName IN :developerNames
        ];
    }
}
