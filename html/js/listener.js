window.addEventListener('message', (event) => {
    logs.Log("Got event: " + event.data.type)
    switch (event.data.type) {
        case 'open':
            main.SetData(event.data.charinfo)
            main.ShowCityhall();
            break;
        case 'jobs':
            job.ClearJobs();

            event.data.jobs.forEach(jobdata => {
                job.AddJob(jobdata);
            });
            break;
        case 'items':
            identity.ClearIdentity();
            
            event.data.items.forEach(identitydata => {
                identity.AddButton(identitydata);
            });
            break;
        case 'information':
            information.ClearInformation();

            event.data.items.forEach(informationdata => {
                information.AddItem(informationdata);
            });

            event.data.licenses.forEach(informationdata => {
                information.AddLicense(informationdata);
            });
            break;
    }
});
