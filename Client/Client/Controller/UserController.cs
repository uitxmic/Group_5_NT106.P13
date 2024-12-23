﻿using Client.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace Client.Controller
{
    public class UserController
    {
        private readonly HttpClient _httpClient;
        public UserController(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }
        public async Task<string> SignUpAsync(string username, string password, string fullname, string email, int userrole)
        {
            var signUpURL = "http://127.0.0.1:8002/create_user/";
            var userdata = new
            {
                username = username,
                password = password,
                fullname = fullname,
                email = email,
                userroleid = userrole
            };
            var content = new StringContent(JsonSerializer.Serialize(userdata), Encoding.UTF8, "application/json");
            var response = await _httpClient.PostAsync(signUpURL, content);
            if (!response.IsSuccessStatusCode)
            {
                var errorContent = await response.Content.ReadAsStringAsync();
                return $"Error: {response.StatusCode}: {errorContent}";
            }

            var responseContent = await response.Content.ReadAsStringAsync();
            return $"Sign Up Successfully";
        }
        public async Task<AuthToken> LoginAsync(string username, string password)
        {
            var loginURL = "http://127.0.0.1:8002/login/";
            var loginData = new
            {
                username = username,
                password = password
            };

            var content = new StringContent(JsonSerializer.Serialize(loginData), Encoding.UTF8, "application/json");
            var response = await _httpClient.PostAsync(loginURL, content);

            if (!response.IsSuccessStatusCode)
            {
                var errorContent = await response.Content.ReadAsStringAsync();
                throw new Exception($"Error: {response.StatusCode}: {errorContent}");
            }

            var responseContent = await response.Content.ReadAsStringAsync();
            var authToken = JsonSerializer.Deserialize<AuthToken>(responseContent);
            return authToken;
        }
        public async Task<UserInfo> UserInfoAsync(string username, string password, AuthToken authToken)
        {
            var loginURL = "http://127.0.0.1:8002/userinfo/";
            var loginData = new
            {
                username = username,
                password = password
            };

            var content = new StringContent(JsonSerializer.Serialize(loginData), Encoding.UTF8, "application/json");
            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue(authToken.TokenType, authToken.AccessToken);

            var response = await _httpClient.PostAsync(loginURL, content);

            if (!response.IsSuccessStatusCode)
            {
                var errorContent = await response.Content.ReadAsStringAsync();
                throw new Exception($"Error: {response.StatusCode}: {errorContent}");
            }

            var responseContent = await response.Content.ReadAsStringAsync();
            var userinfo = JsonSerializer.Deserialize<UserInfo>(responseContent);
            return userinfo;
        }
        public async Task<List<CustomerInfo>> CustomerInfoAsync(int userRoleId)
        {
            var customerURL = $"http://127.0.0.1:8002/getlistcustomer?userroleid={userRoleId}";
            var response = await _httpClient.GetAsync(customerURL);
            if (!response.IsSuccessStatusCode)
            {
                var errorContent = await response.Content.ReadAsStringAsync();
                throw new Exception($"Error: {errorContent}");
            }
            var responseContent = await response.Content.ReadAsStringAsync();
            var customerInfo = JsonSerializer.Deserialize<List<CustomerInfo>>(responseContent);
            return customerInfo;
        }
        public async Task<ReturnMessage> UpdateCustomerVIPAsync(int userId)
        {
            var updateURL = "http://127.0.0.1:8002/updateVipCustomer";
            var updateData = new
            {
                userid = userId
            };
            var content = new StringContent(JsonSerializer.Serialize(updateData), Encoding.UTF8, "application/json");
            var response = await _httpClient.PostAsync(updateURL, content);
            if (!response.IsSuccessStatusCode)
            {
                var errorContent = await response.Content.ReadAsStringAsync();
                throw new Exception($"Error: {response.StatusCode}: {errorContent}");
            }
            var responseContent = await response.Content.ReadAsStringAsync();
            var result = JsonSerializer.Deserialize<ReturnMessage>(responseContent);
            return result;
        }
        public async Task<ReturnMessage> UpdateCustomerRegularAsync(int userId)
        {
            var updateURL = "http://127.0.0.1:8002/updateRegularCustomer";
            var updateData = new
            {
                userid = userId
            };
            var content = new StringContent(JsonSerializer.Serialize(updateData), Encoding.UTF8, "application/json");
            var response = await _httpClient.PostAsync(updateURL, content);
            if (!response.IsSuccessStatusCode)
            {
                var errorContent = await response.Content.ReadAsStringAsync();
                throw new Exception($"Error: {response.StatusCode}: {errorContent}");
            }
            var responseContent = await response.Content.ReadAsStringAsync();
            var result = JsonSerializer.Deserialize<ReturnMessage>(responseContent);
            return result;
        }
    }
}
