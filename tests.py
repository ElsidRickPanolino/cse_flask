import unittest
from app import app

class TestEmployeeAPI(unittest.TestCase):

    def setUp(self):
        app.config['TESTING'] = True
        app.config['DEBUG'] = False
        self.app = app.test_client()

    def tearDown(self):
        pass

    def test_get_employees(self):
        response = self.app.get('/employees')
        self.assertTrue("Serencio" in response.data.decode())
        self.assertEqual(response.status_code, 200)

    def test_get_employee_by_id(self):
        employee_id = 1
        response = self.app.get(f'/employees/{employee_id}')
        self.assertEqual(response.status_code, 200)

    def test_add_employee(self):
        data = {
            "first_name": "John",
            "last_name": "Doe",
            "department": "IT",
            "cell_mobile": "1234567890",
            "email_address": "john@example.com",
            "other_details": "Some details"
        }
        response = self.app.post('/employees', json=data)
        self.assertEqual(response.status_code, 201)

    def test_update_employee(self):
        employee_id = 1 
        data = {
            "first_name": "UpdatedName",
        }
        response = self.app.put(f'/employees/{employee_id}', json=data)
        self.assertEqual(response.status_code, 200)

    def test_delete_employee(self):
        employee_id = 10 
        response = self.app.delete(f'/employees/{employee_id}')
        self.assertEqual(response.status_code, 200)

if __name__ == '__main__':
    unittest.main()
