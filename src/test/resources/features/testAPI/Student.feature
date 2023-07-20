Feature: Student details

Background:
  * url 'http://localhost:8500'

Scenario: Create a token to access the api
  Given path 'token'
  And header Client-Id = 'DPEQE'
  And configure ssl = true
  And request { key: 'quality-engineering' }
  When method POST
  Then status 200

Scenario: Provided invalid key
    Given path 'token'
    And header Client-Id = 'DPEQE'
    And configure ssl = true
    And request { key: 'quay-engineering' }
    When method POST
    Then status 400

Scenario: Other error messages
    Given path 'tok'
    And header Client-Id = 'DPEQE'
    And configure ssl = true
    And request { key: 'quality-engineering' }
    When method POST
    Then status 502

Scenario: Create a new student
    Given path 'student/create'
    And header Client-Id = 'DPEQE'
    And header Authorization = 'vamHApjTHEFxnyMTsXtWmOGPYLsdyPbrxvrVGGfXhmTwmBMmfTVKgmKthOVHcRFefnBjJSuIhSoDhJszZGyMevArsQfUmqHVpjNbEdTspcOGLErUQBJlJuQXeqQbxeVzCGirOFZCSvSYYdLWNXvgHfneRBVZVwlOSopoWqJWpuKDkwDjsiIZbOoItCRRUqsXWItajzHpQbYYMDAslewzkibOdfNkkJkOGvyoJRsroyhdQwgPrxMWbmHgkYkoSKpPverVXReYJveeHNkvZjzgPCOfiJdWUsWHlGGGTXyVqqhbCKUaYITetqIOdSmfubeYHPAiDNYigFSiIvTSjYKYnLttBwTLUCNUKpTWIFVzKDtCUJpGIxhbsAYaBeOxNGXRAKTInyoYSIasTZJQedHbfCzIOYYCNCioReBgyrJBqbscYGOXScsmDwLoOUljkwCFIYazLfqDCBWLVTxxjVQIeHEctfNWfkkYxyasuMrpdcDEbRtPnBykNDjWNhtzpPoZhqupgNCyBwtLJSgqKDrKaSekzcbXHkCjTEgXsumryueqXpKFtvwWVTfFOUlRGToFGVVbWuhLDVGEMMUpnbvPqzJCeLDKLXHtnekfbwTZnbfFTnXBaTeAOmFhRYtVFqaqwVGwaAEduacIFLBPrYdddjJIFyOXSmbymPuHessKsRCGQVQJRTqLYeZPDAaEmydzDJRKMSweAnbFrhrvsUbjbjTpRDeWEJJqBZVEsVrWMeTirsLuWgDARMCJMesGuReoiiXScYqnmMcPimfPOGBalynjjqodDurNUvOnERURSKCCyubxrOmmJMfjkZQoiXNUnCUtnhPzxfZeyOSeoIhKDZhAUTQMyBKlTfIohlzOLrXyVnDlcxwuSsQfAfrXANuPCVvdyNrabdWaopKQlyBCqsNWjZNRrvJTvzGdDaBlswnHUlqXckDVBhesGbRsNtBwGJBdjfQsltUFseockenUidFfXbTNucKnktsjwHEQECHaGmMzjvNMWTmJWeKdDBOcRiYc'
    And configure ssl = true
    And request {"firstName": "vivek","lastName": "vijay","nationality": "India","dateOfBirth": "1995-11-09","email": "vivekvijay11195@gmail.com","mobileNumber": "09876543"}
    When method POST
    Then status 201

Scenario: Missing or invalid client-id or authorization token
    Given path 'student/create'
    And header Client-Id = 'DPEQE'
    And header Authorization = ''
    And configure ssl = true
    And request {"firstName": "vivek","lastName": "vijay","nationality": "India","dateOfBirth": "1995-11-09","email": "vivekvijay1195@gmail.com","mobileNumber": "09876543"}
    When method POST
    Then status 401

Scenario: Student already exist error message
    Given path 'student/create'
    And header Client-Id = 'DPEQE'
    And header Authorization = 'vamHApjTHEFxnyMTsXtWmOGPYLsdyPbrxvrVGGfXhmTwmBMmfTVKgmKthOVHcRFefnBjJSuIhSoDhJszZGyMevArsQfUmqHVpjNbEdTspcOGLErUQBJlJuQXeqQbxeVzCGirOFZCSvSYYdLWNXvgHfneRBVZVwlOSopoWqJWpuKDkwDjsiIZbOoItCRRUqsXWItajzHpQbYYMDAslewzkibOdfNkkJkOGvyoJRsroyhdQwgPrxMWbmHgkYkoSKpPverVXReYJveeHNkvZjzgPCOfiJdWUsWHlGGGTXyVqqhbCKUaYITetqIOdSmfubeYHPAiDNYigFSiIvTSjYKYnLttBwTLUCNUKpTWIFVzKDtCUJpGIxhbsAYaBeOxNGXRAKTInyoYSIasTZJQedHbfCzIOYYCNCioReBgyrJBqbscYGOXScsmDwLoOUljkwCFIYazLfqDCBWLVTxxjVQIeHEctfNWfkkYxyasuMrpdcDEbRtPnBykNDjWNhtzpPoZhqupgNCyBwtLJSgqKDrKaSekzcbXHkCjTEgXsumryueqXpKFtvwWVTfFOUlRGToFGVVbWuhLDVGEMMUpnbvPqzJCeLDKLXHtnekfbwTZnbfFTnXBaTeAOmFhRYtVFqaqwVGwaAEduacIFLBPrYdddjJIFyOXSmbymPuHessKsRCGQVQJRTqLYeZPDAaEmydzDJRKMSweAnbFrhrvsUbjbjTpRDeWEJJqBZVEsVrWMeTirsLuWgDARMCJMesGuReoiiXScYqnmMcPimfPOGBalynjjqodDurNUvOnERURSKCCyubxrOmmJMfjkZQoiXNUnCUtnhPzxfZeyOSeoIhKDZhAUTQMyBKlTfIohlzOLrXyVnDlcxwuSsQfAfrXANuPCVvdyNrabdWaopKQlyBCqsNWjZNRrvJTvzGdDaBlswnHUlqXckDVBhesGbRsNtBwGJBdjfQsltUFseockenUidFfXbTNucKnktsjwHEQECHaGmMzjvNMWTmJWeKdDBOcRiYc'
    And configure ssl = true
    And request {"firstName": "vivek","lastName": "vijay","nationality": "India","dateOfBirth": "1995-11-09","email": "vivekvijay1195@gmail.com","mobileNumber": "09876543"}
    When method POST
    Then status 400

Scenario: Other error messages
    Given path 'studt/create'
    And header Client-Id = 'DPEQE'
    And header Authorization = 'vamHApjTHEFxnyMTsXtWmOGPYLsdyPbrxvrVGGfXhmTwmBMmfTVKgmKthOVHcRFefnBjJSuIhSoDhJszZGyMevArsQfUmqHVpjNbEdTspcOGLErUQBJlJuQXeqQbxeVzCGirOFZCSvSYYdLWNXvgHfneRBVZVwlOSopoWqJWpuKDkwDjsiIZbOoItCRRUqsXWItajzHpQbYYMDAslewzkibOdfNkkJkOGvyoJRsroyhdQwgPrxMWbmHgkYkoSKpPverVXReYJveeHNkvZjzgPCOfiJdWUsWHlGGGTXyVqqhbCKUaYITetqIOdSmfubeYHPAiDNYigFSiIvTSjYKYnLttBwTLUCNUKpTWIFVzKDtCUJpGIxhbsAYaBeOxNGXRAKTInyoYSIasTZJQedHbfCzIOYYCNCioReBgyrJBqbscYGOXScsmDwLoOUljkwCFIYazLfqDCBWLVTxxjVQIeHEctfNWfkkYxyasuMrpdcDEbRtPnBykNDjWNhtzpPoZhqupgNCyBwtLJSgqKDrKaSekzcbXHkCjTEgXsumryueqXpKFtvwWVTfFOUlRGToFGVVbWuhLDVGEMMUpnbvPqzJCeLDKLXHtnekfbwTZnbfFTnXBaTeAOmFhRYtVFqaqwVGwaAEduacIFLBPrYdddjJIFyOXSmbymPuHessKsRCGQVQJRTqLYeZPDAaEmydzDJRKMSweAnbFrhrvsUbjbjTpRDeWEJJqBZVEsVrWMeTirsLuWgDARMCJMesGuReoiiXScYqnmMcPimfPOGBalynjjqodDurNUvOnERURSKCCyubxrOmmJMfjkZQoiXNUnCUtnhPzxfZeyOSeoIhKDZhAUTQMyBKlTfIohlzOLrXyVnDlcxwuSsQfAfrXANuPCVvdyNrabdWaopKQlyBCqsNWjZNRrvJTvzGdDaBlswnHUlqXckDVBhesGbRsNtBwGJBdjfQsltUFseockenUidFfXbTNucKnktsjwHEQECHaGmMzjvNMWTmJWeKdDBOcRiYc'
    And configure ssl = true
    And request {"firstName": "vivek","lastName": "vijay","nationality": "India","dateOfBirth": "1995-11-09","email": "vivekvijay11195@gmail.com","mobileNumber": "09876543"}
    When method POST
    Then status 502

Scenario: View the newley created student
    Given path 'student/e94b6e4e-2b86-4eca-be8c-a6a4c523f3b0/details'
    And header Client-Id = 'DPEQE'
    And header Authorization = 'vamHApjTHEFxnyMTsXtWmOGPYLsdyPbrxvrVGGfXhmTwmBMmfTVKgmKthOVHcRFefnBjJSuIhSoDhJszZGyMevArsQfUmqHVpjNbEdTspcOGLErUQBJlJuQXeqQbxeVzCGirOFZCSvSYYdLWNXvgHfneRBVZVwlOSopoWqJWpuKDkwDjsiIZbOoItCRRUqsXWItajzHpQbYYMDAslewzkibOdfNkkJkOGvyoJRsroyhdQwgPrxMWbmHgkYkoSKpPverVXReYJveeHNkvZjzgPCOfiJdWUsWHlGGGTXyVqqhbCKUaYITetqIOdSmfubeYHPAiDNYigFSiIvTSjYKYnLttBwTLUCNUKpTWIFVzKDtCUJpGIxhbsAYaBeOxNGXRAKTInyoYSIasTZJQedHbfCzIOYYCNCioReBgyrJBqbscYGOXScsmDwLoOUljkwCFIYazLfqDCBWLVTxxjVQIeHEctfNWfkkYxyasuMrpdcDEbRtPnBykNDjWNhtzpPoZhqupgNCyBwtLJSgqKDrKaSekzcbXHkCjTEgXsumryueqXpKFtvwWVTfFOUlRGToFGVVbWuhLDVGEMMUpnbvPqzJCeLDKLXHtnekfbwTZnbfFTnXBaTeAOmFhRYtVFqaqwVGwaAEduacIFLBPrYdddjJIFyOXSmbymPuHessKsRCGQVQJRTqLYeZPDAaEmydzDJRKMSweAnbFrhrvsUbjbjTpRDeWEJJqBZVEsVrWMeTirsLuWgDARMCJMesGuReoiiXScYqnmMcPimfPOGBalynjjqodDurNUvOnERURSKCCyubxrOmmJMfjkZQoiXNUnCUtnhPzxfZeyOSeoIhKDZhAUTQMyBKlTfIohlzOLrXyVnDlcxwuSsQfAfrXANuPCVvdyNrabdWaopKQlyBCqsNWjZNRrvJTvzGdDaBlswnHUlqXckDVBhesGbRsNtBwGJBdjfQsltUFseockenUidFfXbTNucKnktsjwHEQECHaGmMzjvNMWTmJWeKdDBOcRiYc'
    And configure ssl = true
    When method GET
    Then status 200

Scenario: Missing client-id or authorization key
    Given path 'student/e94b6e4e-2b86-4eca-be8c-a6a4c523f3b0/details'
    And header Client-Id = ''
    And header Authorization = 'vamHApjTHEFxnyMTsXtWmOGPYLsdyPbrxvrVGGfXhmTwmBMmfTVKgmKthOVHcRFefnBjJSuIhSoDhJszZGyMevArsQfUmqHVpjNbEdTspcOGLErUQBJlJuQXeqQbxeVzCGirOFZCSvSYYdLWNXvgHfneRBVZVwlOSopoWqJWpuKDkwDjsiIZbOoItCRRUqsXWItajzHpQbYYMDAslewzkibOdfNkkJkOGvyoJRsroyhdQwgPrxMWbmHgkYkoSKpPverVXReYJveeHNkvZjzgPCOfiJdWUsWHlGGGTXyVqqhbCKUaYITetqIOdSmfubeYHPAiDNYigFSiIvTSjYKYnLttBwTLUCNUKpTWIFVzKDtCUJpGIxhbsAYaBeOxNGXRAKTInyoYSIasTZJQedHbfCzIOYYCNCioReBgyrJBqbscYGOXScsmDwLoOUljkwCFIYazLfqDCBWLVTxxjVQIeHEctfNWfkkYxyasuMrpdcDEbRtPnBykNDjWNhtzpPoZhqupgNCyBwtLJSgqKDrKaSekzcbXHkCjTEgXsumryueqXpKFtvwWVTfFOUlRGToFGVVbWuhLDVGEMMUpnbvPqzJCeLDKLXHtnekfbwTZnbfFTnXBaTeAOmFhRYtVFqaqwVGwaAEduacIFLBPrYdddjJIFyOXSmbymPuHessKsRCGQVQJRTqLYeZPDAaEmydzDJRKMSweAnbFrhrvsUbjbjTpRDeWEJJqBZVEsVrWMeTirsLuWgDARMCJMesGuReoiiXScYqnmMcPimfPOGBalynjjqodDurNUvOnERURSKCCyubxrOmmJMfjkZQoiXNUnCUtnhPzxfZeyOSeoIhKDZhAUTQMyBKlTfIohlzOLrXyVnDlcxwuSsQfAfrXANuPCVvdyNrabdWaopKQlyBCqsNWjZNRrvJTvzGdDaBlswnHUlqXckDVBhesGbRsNtBwGJBdjfQsltUFseockenUidFfXbTNucKnktsjwHEQECHaGmMzjvNMWTmJWeKdDBOcRiYc'
    And configure ssl = true
    When method GET
    Then status 401

Scenario: Invalid student id
    Given path 'student/e9e-2b86-4eca-be8c-a6a4c523f3b0/details'
    And header Client-Id = 'DPEQE'
    And header Authorization = 'vamHApjTHEFxnyMTsXtWmOGPYLsdyPbrxvrVGGfXhmTwmBMmfTVKgmKthOVHcRFefnBjJSuIhSoDhJszZGyMevArsQfUmqHVpjNbEdTspcOGLErUQBJlJuQXeqQbxeVzCGirOFZCSvSYYdLWNXvgHfneRBVZVwlOSopoWqJWpuKDkwDjsiIZbOoItCRRUqsXWItajzHpQbYYMDAslewzkibOdfNkkJkOGvyoJRsroyhdQwgPrxMWbmHgkYkoSKpPverVXReYJveeHNkvZjzgPCOfiJdWUsWHlGGGTXyVqqhbCKUaYITetqIOdSmfubeYHPAiDNYigFSiIvTSjYKYnLttBwTLUCNUKpTWIFVzKDtCUJpGIxhbsAYaBeOxNGXRAKTInyoYSIasTZJQedHbfCzIOYYCNCioReBgyrJBqbscYGOXScsmDwLoOUljkwCFIYazLfqDCBWLVTxxjVQIeHEctfNWfkkYxyasuMrpdcDEbRtPnBykNDjWNhtzpPoZhqupgNCyBwtLJSgqKDrKaSekzcbXHkCjTEgXsumryueqXpKFtvwWVTfFOUlRGToFGVVbWuhLDVGEMMUpnbvPqzJCeLDKLXHtnekfbwTZnbfFTnXBaTeAOmFhRYtVFqaqwVGwaAEduacIFLBPrYdddjJIFyOXSmbymPuHessKsRCGQVQJRTqLYeZPDAaEmydzDJRKMSweAnbFrhrvsUbjbjTpRDeWEJJqBZVEsVrWMeTirsLuWgDARMCJMesGuReoiiXScYqnmMcPimfPOGBalynjjqodDurNUvOnERURSKCCyubxrOmmJMfjkZQoiXNUnCUtnhPzxfZeyOSeoIhKDZhAUTQMyBKlTfIohlzOLrXyVnDlcxwuSsQfAfrXANuPCVvdyNrabdWaopKQlyBCqsNWjZNRrvJTvzGdDaBlswnHUlqXckDVBhesGbRsNtBwGJBdjfQsltUFseockenUidFfXbTNucKnktsjwHEQECHaGmMzjvNMWTmJWeKdDBOcRiYc'
    And configure ssl = true
    When method GET
    Then status 404

Scenario: other error messges
    Given path 'stt/e9e-2b86-4eca-be8c-a6a4c523f3b0/details'
    And header Client-Id = 'DPEQE'
    And header Authorization = 'vamHApjTHEFxnyMTsXtWmOGPYLsdyPbrxvrVGGfXhmTwmBMmfTVKgmKthOVHcRFefnBjJSuIhSoDhJszZGyMevArsQfUmqHVpjNbEdTspcOGLErUQBJlJuQXeqQbxeVzCGirOFZCSvSYYdLWNXvgHfneRBVZVwlOSopoWqJWpuKDkwDjsiIZbOoItCRRUqsXWItajzHpQbYYMDAslewzkibOdfNkkJkOGvyoJRsroyhdQwgPrxMWbmHgkYkoSKpPverVXReYJveeHNkvZjzgPCOfiJdWUsWHlGGGTXyVqqhbCKUaYITetqIOdSmfubeYHPAiDNYigFSiIvTSjYKYnLttBwTLUCNUKpTWIFVzKDtCUJpGIxhbsAYaBeOxNGXRAKTInyoYSIasTZJQedHbfCzIOYYCNCioReBgyrJBqbscYGOXScsmDwLoOUljkwCFIYazLfqDCBWLVTxxjVQIeHEctfNWfkkYxyasuMrpdcDEbRtPnBykNDjWNhtzpPoZhqupgNCyBwtLJSgqKDrKaSekzcbXHkCjTEgXsumryueqXpKFtvwWVTfFOUlRGToFGVVbWuhLDVGEMMUpnbvPqzJCeLDKLXHtnekfbwTZnbfFTnXBaTeAOmFhRYtVFqaqwVGwaAEduacIFLBPrYdddjJIFyOXSmbymPuHessKsRCGQVQJRTqLYeZPDAaEmydzDJRKMSweAnbFrhrvsUbjbjTpRDeWEJJqBZVEsVrWMeTirsLuWgDARMCJMesGuReoiiXScYqnmMcPimfPOGBalynjjqodDurNUvOnERURSKCCyubxrOmmJMfjkZQoiXNUnCUtnhPzxfZeyOSeoIhKDZhAUTQMyBKlTfIohlzOLrXyVnDlcxwuSsQfAfrXANuPCVvdyNrabdWaopKQlyBCqsNWjZNRrvJTvzGdDaBlswnHUlqXckDVBhesGbRsNtBwGJBdjfQsltUFseockenUidFfXbTNucKnktsjwHEQECHaGmMzjvNMWTmJWeKdDBOcRiYc'
    And configure ssl = true
    When method GET
    Then status 502

Scenario: View all the student details
    Given path 'students'
    And header Client-Id = 'DPEQE'
    And header Authorization = 'vamHApjTHEFxnyMTsXtWmOGPYLsdyPbrxvrVGGfXhmTwmBMmfTVKgmKthOVHcRFefnBjJSuIhSoDhJszZGyMevArsQfUmqHVpjNbEdTspcOGLErUQBJlJuQXeqQbxeVzCGirOFZCSvSYYdLWNXvgHfneRBVZVwlOSopoWqJWpuKDkwDjsiIZbOoItCRRUqsXWItajzHpQbYYMDAslewzkibOdfNkkJkOGvyoJRsroyhdQwgPrxMWbmHgkYkoSKpPverVXReYJveeHNkvZjzgPCOfiJdWUsWHlGGGTXyVqqhbCKUaYITetqIOdSmfubeYHPAiDNYigFSiIvTSjYKYnLttBwTLUCNUKpTWIFVzKDtCUJpGIxhbsAYaBeOxNGXRAKTInyoYSIasTZJQedHbfCzIOYYCNCioReBgyrJBqbscYGOXScsmDwLoOUljkwCFIYazLfqDCBWLVTxxjVQIeHEctfNWfkkYxyasuMrpdcDEbRtPnBykNDjWNhtzpPoZhqupgNCyBwtLJSgqKDrKaSekzcbXHkCjTEgXsumryueqXpKFtvwWVTfFOUlRGToFGVVbWuhLDVGEMMUpnbvPqzJCeLDKLXHtnekfbwTZnbfFTnXBaTeAOmFhRYtVFqaqwVGwaAEduacIFLBPrYdddjJIFyOXSmbymPuHessKsRCGQVQJRTqLYeZPDAaEmydzDJRKMSweAnbFrhrvsUbjbjTpRDeWEJJqBZVEsVrWMeTirsLuWgDARMCJMesGuReoiiXScYqnmMcPimfPOGBalynjjqodDurNUvOnERURSKCCyubxrOmmJMfjkZQoiXNUnCUtnhPzxfZeyOSeoIhKDZhAUTQMyBKlTfIohlzOLrXyVnDlcxwuSsQfAfrXANuPCVvdyNrabdWaopKQlyBCqsNWjZNRrvJTvzGdDaBlswnHUlqXckDVBhesGbRsNtBwGJBdjfQsltUFseockenUidFfXbTNucKnktsjwHEQECHaGmMzjvNMWTmJWeKdDBOcRiYc'
    And configure ssl = true
    When method GET
    Then status 200

Scenario: Invalid or missing client-id or Authorization key
    Given path 'students'
    And header Client-Id = ''
    And header Authorization = 'vamHApjTHEFxnyMTsXtWmOGPYLsdyPbrxvrVGGfXhmTwmBMmfTVKgmKthOVHcRFefnBjJSuIhSoDhJszZGyMevArsQfUmqHVpjNbEdTspcOGLErUQBJlJuQXeqQbxeVzCGirOFZCSvSYYdLWNXvgHfneRBVZVwlOSopoWqJWpuKDkwDjsiIZbOoItCRRUqsXWItajzHpQbYYMDAslewzkibOdfNkkJkOGvyoJRsroyhdQwgPrxMWbmHgkYkoSKpPverVXReYJveeHNkvZjzgPCOfiJdWUsWHlGGGTXyVqqhbCKUaYITetqIOdSmfubeYHPAiDNYigFSiIvTSjYKYnLttBwTLUCNUKpTWIFVzKDtCUJpGIxhbsAYaBeOxNGXRAKTInyoYSIasTZJQedHbfCzIOYYCNCioReBgyrJBqbscYGOXScsmDwLoOUljkwCFIYazLfqDCBWLVTxxjVQIeHEctfNWfkkYxyasuMrpdcDEbRtPnBykNDjWNhtzpPoZhqupgNCyBwtLJSgqKDrKaSekzcbXHkCjTEgXsumryueqXpKFtvwWVTfFOUlRGToFGVVbWuhLDVGEMMUpnbvPqzJCeLDKLXHtnekfbwTZnbfFTnXBaTeAOmFhRYtVFqaqwVGwaAEduacIFLBPrYdddjJIFyOXSmbymPuHessKsRCGQVQJRTqLYeZPDAaEmydzDJRKMSweAnbFrhrvsUbjbjTpRDeWEJJqBZVEsVrWMeTirsLuWgDARMCJMesGuReoiiXScYqnmMcPimfPOGBalynjjqodDurNUvOnERURSKCCyubxrOmmJMfjkZQoiXNUnCUtnhPzxfZeyOSeoIhKDZhAUTQMyBKlTfIohlzOLrXyVnDlcxwuSsQfAfrXANuPCVvdyNrabdWaopKQlyBCqsNWjZNRrvJTvzGdDaBlswnHUlqXckDVBhesGbRsNtBwGJBdjfQsltUFseockenUidFfXbTNucKnktsjwHEQECHaGmMzjvNMWTmJWeKdDBOcRiYc'
    And configure ssl = true
    When method GET
    Then status 401

Scenario: View all the student details
    Given path 'stuts'
    And header Client-Id = 'DPEQE'
    And header Authorization = 'vamHApjTHEFxnyMTsXtWmOGPYLsdyPbrxvrVGGfXhmTwmBMmfTVKgmKthOVHcRFefnBjJSuIhSoDhJszZGyMevArsQfUmqHVpjNbEdTspcOGLErUQBJlJuQXeqQbxeVzCGirOFZCSvSYYdLWNXvgHfneRBVZVwlOSopoWqJWpuKDkwDjsiIZbOoItCRRUqsXWItajzHpQbYYMDAslewzkibOdfNkkJkOGvyoJRsroyhdQwgPrxMWbmHgkYkoSKpPverVXReYJveeHNkvZjzgPCOfiJdWUsWHlGGGTXyVqqhbCKUaYITetqIOdSmfubeYHPAiDNYigFSiIvTSjYKYnLttBwTLUCNUKpTWIFVzKDtCUJpGIxhbsAYaBeOxNGXRAKTInyoYSIasTZJQedHbfCzIOYYCNCioReBgyrJBqbscYGOXScsmDwLoOUljkwCFIYazLfqDCBWLVTxxjVQIeHEctfNWfkkYxyasuMrpdcDEbRtPnBykNDjWNhtzpPoZhqupgNCyBwtLJSgqKDrKaSekzcbXHkCjTEgXsumryueqXpKFtvwWVTfFOUlRGToFGVVbWuhLDVGEMMUpnbvPqzJCeLDKLXHtnekfbwTZnbfFTnXBaTeAOmFhRYtVFqaqwVGwaAEduacIFLBPrYdddjJIFyOXSmbymPuHessKsRCGQVQJRTqLYeZPDAaEmydzDJRKMSweAnbFrhrvsUbjbjTpRDeWEJJqBZVEsVrWMeTirsLuWgDARMCJMesGuReoiiXScYqnmMcPimfPOGBalynjjqodDurNUvOnERURSKCCyubxrOmmJMfjkZQoiXNUnCUtnhPzxfZeyOSeoIhKDZhAUTQMyBKlTfIohlzOLrXyVnDlcxwuSsQfAfrXANuPCVvdyNrabdWaopKQlyBCqsNWjZNRrvJTvzGdDaBlswnHUlqXckDVBhesGbRsNtBwGJBdjfQsltUFseockenUidFfXbTNucKnktsjwHEQECHaGmMzjvNMWTmJWeKdDBOcRiYc'
    And configure ssl = true
    When method GET
    Then status 502